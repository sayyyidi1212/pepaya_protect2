import 'package:flutter/material.dart';
import 'package:patrol_track_mobile/components/header.dart';

class HistoryPresence extends StatefulWidget {
  @override
  _HistoryPresenceState createState() => _HistoryPresenceState();
}

class _HistoryPresenceState extends State<HistoryPresence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(title: "History Presence", backButton: true),
        ],
      ),
    );
  }
}