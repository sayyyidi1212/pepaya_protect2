import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Report extends StatefulWidget {
  final String scanData;

  Report({required this.scanData});

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  late TextEditingController _resultController;
  late TextEditingController _notesController;
  String _status = 'Aman';
  late String _currentTime;
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  final cloudinary = CloudinaryPublic('df3wkm3n3', 'your_upload_preset', cache: false);

  @override
  void initState() {
    super.initState();
    _resultController = TextEditingController(text: widget.scanData);
    _notesController = TextEditingController();
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      _currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    });
    Future.delayed(Duration(seconds: 1), _updateTime);
  }

  // Future<void> _pickImage() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     _imageFile = pickedFile;
  //   });

  //   if (pickedFile != null) {
  //     await _uploadImageToCloudinary(pickedFile);
  //   }
  // }

  Future<void> _pickImage() async {
  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

  setState(() {
    _imageFile = pickedFile;
  });

  if (pickedFile != null) {
    await _uploadImageToCloudinary(pickedFile);
  }
  }


  Future<void> _uploadImageToCloudinary(XFile imageFile) async {
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(imageFile.path, resourceType: CloudinaryResourceType.Image),
      );
      print('Image uploaded: ${response.secureUrl}');
      await _saveImageUrlToDatabase(response.secureUrl);
    } catch (e) {
      print('Image upload failed: $e');
    }
  }

  
  Future<void> _saveImageUrlToDatabase(String imageUrl) async {
  final url = Uri.parse('http://patroltrack.my.id/api/save-image-url'); // Ganti dengan URL endpoint backend Anda
  try {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'imageUrl': imageUrl,
        'notes': _notesController.text,
        'status': _status,
        'scanData': widget.scanData,
        'timestamp': _currentTime,
      }),
    );

    if (response.statusCode == 200) {
      print('Image URL saved to database successfully');
    } else {
      print('Failed to save image URL to database');
    }
  } catch (e) {
    print('Error: $e');
  }
}

  

  void _submitFormPatroli() {
    // Handle form submission
    Get.toNamed('/menu-nav');
  }

  @override
  void dispose() {
    _resultController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Patroli', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF356899),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Text(
                    _currentTime,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Text(
                "Lokasi",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF5F5C5C)),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                  child: Text(
                    widget.scanData,
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Status Lokasi",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF5F5C5C)),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                  child: DropdownButton<String>(
                    value: _status,
                    isExpanded: true,
                    items: <String>['Aman', 'Tidak Aman'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _status = newValue!;
                      });
                    },
                    underline: Container(),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Catatan Patroli",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _notesController,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Unggah Bukti",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: _pickImage,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF5F5C5C)),
                    borderRadius: BorderRadius.circular(5),
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
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  onPressed: _submitFormPatroli,
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
        ),
      ),
    );
  }
}