import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_track_mobile/components/header.dart';
import 'package:patrol_track_mobile/components/history_card.dart';
import 'package:intl/intl.dart';

class HistoryReport extends StatefulWidget {
  @override
  _HistoryReportState createState() => _HistoryReportState();
}

class _HistoryReportState extends State<HistoryReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(title: "History Activity"),
          Expanded(
            child: Center(
              child: Text(
                'Reports not yet available.',
                style: GoogleFonts.poppins(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
