import 'package:flutter/material.dart';
import 'package:patrol_track_mobile/splash_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 245, 245, 245),
      child: Center(
        child: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.black, // Sesuaikan warna teks jika diperlukan
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}