import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_track_mobile/components/button.dart';
import 'package:patrol_track_mobile/components/header.dart';

class Setting extends StatelessWidget {
  // Contoh data pengguna lokal
  final User user = User(
    name: 'John Doe',
    email: 'johndoe@example.com',
    birthDate: '1990-01-01',
    address: '123 Main St, City',
    phoneNumber: '08123456789',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(title: "Profile"),
          const SizedBox(height: 20),
          Expanded(
            child: _buildSetting(context, user),
          ),
        ],
      ),
    );
  }

  Widget _buildSetting(BuildContext context, User user) {
    final TextEditingController name = TextEditingController(text: user.name);
    final TextEditingController email = TextEditingController(text: user.email);
    final TextEditingController birthDate = TextEditingController(text: user.birthDate);
    final TextEditingController address = TextEditingController(text: user.address);
    final TextEditingController phoneNumber = TextEditingController(text: user.phoneNumber);

    return Column(
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
              const SizedBox(height: 10),
              buildTextField(name, Icons.person),
              const SizedBox(height: 10),
              buildTextField(email, Icons.email_outlined),
              const SizedBox(height: 10),
              buildTextField(birthDate, Icons.calendar_month_outlined),
              const SizedBox(height: 10),
              buildTextField(phoneNumber, Icons.phone_enabled_outlined),
              const SizedBox(height: 10),
              buildTextField(address, Icons.home, maxLines: 2),
              const SizedBox(height: 30),
              MyButton(
                text: "Logout",
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
                              Navigator.of(context).pop();
                            },
                            child: Text("Tidak"),
                          ),
                          TextButton(
                            onPressed: () {
                              // Logout logic goes here
                              Navigator.of(context).pop(); // Close the dialog
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
    );
  }

  Widget buildTextField(TextEditingController controller, IconData icon, {int maxLines = 1}) {
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

class User {
  final String name;
  final String email;
  final String birthDate;
  final String address;
  final String phoneNumber;

  User({
    required this.name,
    required this.email,
    required this.birthDate,
    required this.address,
    required this.phoneNumber,
  });
}
