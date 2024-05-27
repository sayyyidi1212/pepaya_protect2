import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:patrol_track_mobile/components/header.dart';

class Permission extends StatefulWidget {
  @override
  _PermissionState createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  late DateTime _selectedDate;
  final TextEditingController _descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageFiles = [];
  bool _isPermissionTypeValid = false;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFiles.add(pickedFile);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imageFiles.removeAt(index);
    });
  }

  Future<void> _submitForm() async {
    if (_descriptionController.text.isEmpty || _imageFiles.isEmpty) {
      // Handle form validation errors
      return;
    }

    final uri = Uri.parse('http://patroltrack.my.id/permission');
    var request = http.MultipartRequest('POST', uri)
      ..fields['permission_date'] = _selectedDate.toIso8601String()
      ..fields['reason'] = _descriptionController.text;

    for (var imageFile in _imageFiles) {
      request.files.add(await http.MultipartFile.fromPath(
        'information[]',
        imageFile.path,
        filename: basename(imageFile.path),
      ));
    }

    // Tambahkan autentikasi jika perlu, misalnya token
    // request.headers['Authorization'] = 'Bearer YOUR_TOKEN';

    var response = await request.send();

    if (response.statusCode == 201) {
      Get.toNamed('/menu-nav');
    } else {
      // Handle error
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMMM yyyy').format(_selectedDate);

    return Scaffold(
      body: Column(
        children: [
          const Header(title: "Permission", backButton: true),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildDateSelector(formattedDate),
                  _buildPermissionForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector(String formattedDate) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.calendar_month_outlined),
                    onPressed: () => _selectDate(context as BuildContext),
                    color: Colors.blue.shade900,
                  ),
                  Text(
                    formattedDate,
                    style: GoogleFonts.poppins(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            "Keterangan",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 10),
              Text(
                "Unggah Bukti",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: _pickImage,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt),
                  SizedBox(width: 10),
                  Text(
                    "Pilih File",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _imageFiles.map((imageFile) {
              int index = _imageFiles.indexOf(imageFile);
              return Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF5F5C5C)),
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                        image: FileImage(File(imageFile.path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 25,
                    child: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeImage(index),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF305E8B),
                minimumSize: Size(double.infinity, 50),
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Kirim",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}