import 'package:flutter/material.dart';
import 'package:patrol_track_mobile/components/header.dart';

class HelpCenter extends StatefulWidget {
  @override
  _HelpCenterState createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(title: "Help Center", backButton: true),
        ],
      ),
    );
  }
}
