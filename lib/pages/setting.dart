import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_track_mobile/components/button.dart';
import 'package:patrol_track_mobile/components/header.dart';
import 'package:patrol_track_mobile/core/controllers/auth_controller.dart';
import 'package:patrol_track_mobile/core/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final User user = Get.arguments as User;

    final TextEditingController nameController = TextEditingController(text: user.name);
    final TextEditingController emailController = TextEditingController(text: user.email);
    final TextEditingController birthDateController = TextEditingController(text: user.birthDate);
    final TextEditingController addressController = TextEditingController(text: user.address);
    final TextEditingController phoneNumberController = TextEditingController(text: user.phoneNumber);

    return Scaffold(
      body: Column(
        children: [
          const Header(title: "Profile"),
          SizedBox(height: 20),
          Expanded(
            child: Column(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/user_profile.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      SizedBox(height: 10),
                      buildTextField(nameController, Icons.person),
                      SizedBox(height: 10),
                      buildTextField(emailController, Icons.email_outlined),
                      SizedBox(height: 10),
                      buildTextField(birthDateController, Icons.calendar_month_outlined),
                      SizedBox(height: 10),
                      buildTextField(phoneNumberController, Icons.phone_enabled_outlined),
                      SizedBox(height: 10),
                      buildTextField(addressController, Icons.home, maxLines: 2),
                      SizedBox(height: 30),
                      MyButton(
                        text: "Logout",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Konfirmasi Logout"),
                                content:
                                    Text("Apakah Anda yakin ingin keluar?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Tidak"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await AuthController.logout(context, await SharedPreferences.getInstance());
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
          ),
        ],
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, IconData icon,
      {int maxLines = 1}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F3),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              icon,
              color: Colors.grey,
              size: 20.0,
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.black,
              ),
              maxLines: maxLines,
              readOnly: true,
            ),
          ),
        ],
      ),
    );
  }
}