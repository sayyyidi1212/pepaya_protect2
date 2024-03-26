import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:patrol_track_mobile/login.dart';
import 'package:patrol_track_mobile/menu_nav.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPass createState() => _ForgotPass();
}

class _ForgotPass extends State<ForgotPass> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color(0xFF305E8B),
              Color(0xFF1E3B57),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Forgot Password",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                    // SizedBox(height: 10),
                    Text(
                      "Enter your email, we will send a verification code.",
                      style: GoogleFonts.poppins(
                          color: Color(0xFFABBAC8),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
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
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle:
                                      GoogleFonts.poppins(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuNav()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF305E8B),
                            minimumSize: Size(double.infinity, 50),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Send Code",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Login(),
                                ),
                              );
                            },
                            child: Text("Back to Login",
                              style: GoogleFonts.poppins(color: Colors.grey, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ],
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
