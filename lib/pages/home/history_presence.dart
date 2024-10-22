import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patrol_track_mobile/components/header.dart';
import 'package:patrol_track_mobile/components/history_card.dart';

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
          // Komentar atau hapus bagian yang berkaitan dengan backend
          const Center(
            child: Text('No history attendance data available.'),
          ),
        ],
      ),
    );
  }
}
