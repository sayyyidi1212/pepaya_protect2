import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:patrol_track_mobile/baseUrl.dart';
import 'package:patrol_track_mobile/core/controllers/getToken.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  DateTime today = DateTime.now();
  Map<String, dynamic> biodata = {};

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  Future<Map<String, dynamic>> getBiodata() async {
    try {
      final token = await getToken();

      final response = await http.get(
        Uri.parse('${BaseUrl}/api/get-user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token.toString(),
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
        return data;
      } else {
        throw Exception('Failed to load biodata');
      }
    } catch (er) {
      print('error $er');
      return {};
    }
  }

  void setTextFieldData(Map<String, dynamic> biodata) {
    nameController.text = biodata['name'] ?? 'N/A';
    emailController.text = biodata['email'] ?? 'N/A';
    birthDateController.text = biodata['birth-date'] ?? 'N/A';
    addressController.text = biodata['address'] ?? 'N/A';
    phoneNumberController.text = biodata['phone-number'] ?? 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF356899),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 10),
                ),
                Text("Profile",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          FutureBuilder<Map<String, dynamic>>(
            future: getBiodata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No data available'));
              } else {
                final biodata = snapshot.data!['data'];
                setTextFieldData(biodata);
                return Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 0),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.all(20.0),
                          children: [
                            SizedBox(height: 10),
Container(
  decoration: BoxDecoration(
    color: Color(0xFFF2F2F3),
    borderRadius: BorderRadius.circular(7),
  ),
  child: Row( 
    children: [
      Padding( 
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          Icons.person, 
          color: Colors.grey, 
          size: 20.0, 
        ),
      ),
      Expanded( 
        child: TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          style: TextStyle(color: Colors.black),
          maxLines: 1,
          readOnly: true,
        ),
      ),
    ],
  ),
),
                            SizedBox(height: 10),
Container(
  decoration: BoxDecoration(
    color: Color(0xFFF2F2F3),
    borderRadius: BorderRadius.circular(7),
  ),
  child: Row( 
    children: [
      Padding( 
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          Icons.email_outlined, 
          color: Colors.grey, 
          size: 20.0, 
        ),
      ),
      Expanded( 
        child: TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          style: TextStyle(color: Colors.black),
          maxLines: 1,
          readOnly: true,
        ),
      ),
    ],
  ),
),
SizedBox(height: 10),
Container(
  decoration: BoxDecoration(
    color: Color(0xFFF2F2F3),
    borderRadius: BorderRadius.circular(7),
  ),
  child: Row( 
    children: [
      Padding( 
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          Icons.calendar_month_outlined, 
          color: Colors.grey, 
          size: 20.0, 
        ),
      ),
      Expanded( 
        child: TextFormField(
          controller: birthDateController,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          style: TextStyle(color: Colors.black),
          maxLines: 1,
          readOnly: true,
        ),
      ),
    ],
  ),
),
SizedBox(height: 10),
Container(
  decoration: BoxDecoration(
    color: Color(0xFFF2F2F3),
    borderRadius: BorderRadius.circular(7),
  ),
  child: Row( 
    children: [
      Padding( 
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          Icons.phone_enabled_outlined, 
          color: Colors.grey, 
          size: 20.0, 
        ),
      ),
      Expanded( 
        child: TextFormField(
          controller: phoneNumberController,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          style: TextStyle(color: Colors.black),
          maxLines: 1,
          readOnly: true,
        ),
      ),
    ],
  ),
),
SizedBox(height: 10),
Container(
  decoration: BoxDecoration(
    color: Color(0xFFF2F2F3),
    borderRadius: BorderRadius.circular(7),
  ),
  child: Row( 
    children: [
      Padding( 
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          Icons.home, 
          color: Colors.grey, 
          size: 20.0, 
        ),
      ),
      Expanded( 
        child: TextFormField(
          controller: addressController,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          style: TextStyle(color: Colors.black),
          maxLines: 3,
          readOnly: true,
        ),
      ),
    ],
  ),
),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          Container(
  height: MediaQuery.of(context).size.height * 0.15, 
  alignment: Alignment.topCenter, 
  child: ElevatedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Konfirmasi Logout"),
            content: Text("Apakah Anda yakin ingin keluar?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: Text("Tidak"),
              ),
              TextButton(
                onPressed: () {
                  Get.offAllNamed('/login'); // Navigate to login page
                },
                child: Text("Ya"),
              ),
            ],
          );
        },
      );
    },
    child: Text(
      "Keluar",
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  ),
),

        ],
      ),
    );
  }
}