import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_track_mobile/components/header.dart';
// import 'package:file_picker/file_picker.dart';

class Permission extends StatefulWidget {
  @override
  _PermissionState createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  late DateTime _selectedDate;
  String _selectedPermissionType = '';
  final TextEditingController _descriptionController = TextEditingController();
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

  void _submitForm() {
    setState(() {
      _isPermissionTypeValid = _selectedPermissionType.isNotEmpty;
    });

    if (_isPermissionTypeValid) {
      // Handle form submission
      Get.toNamed('/menu-nav');
    }
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
                    onPressed: () => _selectDate(context),
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
          onTap: () {
        //     void _submitForm() async {
        //     // Pilih file
        //       FilePickerResult? result = await FilePicker.platform.pickFiles();

        //     if (result != null) {
        //     PlatformFile file = result.files.first;

        //    // Handle file here
        //     print('Path: ${file.path}');
        //     print('Name: ${file.name}');
        //     print('Size: ${file.size}');
        //     print('Extension: ${file.extension}');
        //   } else {
        //         // User canceled the picker
        //  }
        // }
          },
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