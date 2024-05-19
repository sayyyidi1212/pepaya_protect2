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
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.all(10.0),
                          children: [
                            TextField(
                              controller: nameController,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Nama',
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: emailController,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Email',
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: birthDateController,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Tanggal Lahir',
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: addressController,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Alamat',
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: phoneNumberController,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Nomor Telepon',
                              ),
                            ),
                            SizedBox(height: 5),
                            ListTile(
                              leading: Icon(Icons.help_outline, color: Colors.black),
                              title: Text(
                                "Bantuan",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                Get.toNamed('/help-center');
                              },
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.logout, color: Colors.black),
                              title: Text(
                                "Keluar",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Konfirmasi Logout"),
                                      content: Text("Apakah Anda yakin ingin keluar?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Tutup dialog
                                          },
                                          child: Text("Tidak"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.offAllNamed('/login'); // Navigasi ke halaman login
                                          },
                                          child: Text("Ya"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
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
        ],
      ),
    );
  }
}