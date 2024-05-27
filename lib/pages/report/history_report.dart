import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_track_mobile/components/header.dart';
import 'package:patrol_track_mobile/core/controllers/report_controller.dart';

class HistoryReport extends StatefulWidget {
  @override
  _HistoryReportState createState() => _HistoryReportState();
}

class _HistoryReportState extends State<HistoryReport> {
  late Future<List<dynamic>> _reports;

  @override
  void initState() {
    super.initState();
    _reports = ReportController.fetchReports(context);
  }

  Widget buildCard(String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(title: "History Activity"),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: _reports,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No reports available.'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var report = snapshot.data![index];
                      String title = report['title'] ?? 'No Title';
                      String subtitle = report['subtitle'] ?? 'No Subtitle';

                      return Card(
                        child: buildCard(title, subtitle),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}