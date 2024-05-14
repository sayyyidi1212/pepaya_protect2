import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 40,
              left: 15,
              right: 15,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF356899),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 40,
                    left: 15,
                    right: 15,
                    bottom: 10,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Lainnya",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 125,
                  left: MediaQuery.of(context).size.width / 2 - 75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Fanidiya Tasya",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "tasyaa@gmail.com",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                
              //  Positioned(
              //     top: 220,
              //     left: MediaQuery.of(context).size.width / 2 - 170,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Expanded(flex: 3, child: Text(title, style: Theme.of(context.textTheme.bodySmall, overflow: TextOverflow.ellipsis)))
              //         Expanded(
              //           flex: 5
              //           child: Text(value, style: ,),,
              //         )
              //         Text(
              //           "Nama Lengkap",
              //           style: GoogleFonts.poppins(
              //             fontSize: 14,
              //             fontWeight: FontWeight.normal,
              //             color: Colors.black,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
                
               
                Positioned(
                  top: 330,
                  left: MediaQuery.of(context).size.width / 2 - 175,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/help-center');
                    },
                    child: Container(
                      width: 350,
                      height: 50,
                      padding: EdgeInsets.all(10),
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
                          Icon(
                            Icons.help_outline,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Bantuan",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 400,
                  left: MediaQuery.of(context).size.width / 2 - 175,
                  child: InkWell(
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
                    child: Container(
                      width: 350,
                      height: 50,
                      padding: EdgeInsets.all(10),
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
                          Icon(
                            Icons.logout,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Keluar",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}