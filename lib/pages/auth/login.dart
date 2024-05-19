import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:patrol_track_mobile/baseUrl.dart';
import 'package:patrol_track_mobile/core/controllers/SaveToken.dart';
import 'background.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';


class Login extends StatefulWidget {
  final String title;
  final String subtitle;

  const Login({
    Key? key,
    this.title = "Welcome Back",
    this.subtitle = "Let’s log in, to continue!",
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> AuthLogin(BuildContext context) async {
    {
      try {
        final Map<String, dynamic> requestBody = {
          'email': email.text,
          'password': password.text,
        };
        final response =
            await http.post(Uri.parse("${BaseUrl}/api/login"),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(requestBody));
        Map<String, dynamic> data =
            json.decode(response.body) as Map<String, dynamic>;

        if (response.statusCode == 200) {
          String token = data['token'];
          await saveToken(token);
          Get.toNamed('/menu-nav');
        } else {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Gagal',
            text: data['error'],
          );
        }
      } catch (er) {
        print('error${er}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        title: widget.title,
        subtitle: widget.subtitle,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(225, 255, 255, .3),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[200]!),
                      ),
                    ),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[200]!),
                      ),
                    ),
                    child: TextField(
                      controller: password,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Get.toNamed('/forgot-pass'),
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () => AuthLogin(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF305E8B),
                  minimumSize: Size(double.infinity, 50),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Login",
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
    );
  }
}
