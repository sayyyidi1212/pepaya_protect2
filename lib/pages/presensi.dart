import 'package:flutter/material.dart';
import 'package:patrol_track_mobile/components/header.dart';

class Presensi extends StatefulWidget {
  @override
  _PresensiState createState() => _PresensiState();
}

class _PresensiState extends State<Presensi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(title: "Presensi", backButton: true),
        ],
      ),
    );
  }
}
