import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_track_mobile/components/background_auth.dart';
import 'package:patrol_track_mobile/components/button.dart';
import 'package:patrol_track_mobile/components/textfield_auth.dart';

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
                  MyTextField(
                    controller: email,
                    labelText: "Email",
                  ),
                  MyTextField(
                    controller: password,
                    labelText: "Password",
                    isPassword: true,
                    isObscure: _isObscure,
                    toggleObscureText: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/forgot-pass'),
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            MyButton(
              text: "Login",
              onPressed: () {
                // Tambahkan logika untuk login di sini jika diperlukan
              },
            ),
          ],
        ),
      ),
    );
  }
}
