import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Schedule extends StatelessWidget {
  final List<Map<String, List<String>>> schedule = [
    {"Senin": ["08:00", "10:00", "13:00"]},
    {"Selasa": ["09:00", "11:00", "14:00"]},
    {"Rabu": ["08:30", "10:30", "13:30"]},
    {"Kamis": ["09:30", "11:30", "14:30"]},
    {"Jumat": ["08:45", "10:45", "13:45"]},
    {"Sabtu": ["10:00", "12:00", "15:00"]},
    {"Minggu": ["10:30", "12:30", "15:30"]},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF356899),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 10),
                ),
                SizedBox(width: 10),
                Text("Jadwal",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: schedule.length,
              itemBuilder: (context, index) {
                final daySchedule = schedule[index];
                final day = daySchedule.keys.first;
                final times = daySchedule.values.first;
                return DaySchedule(day, times);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DaySchedule extends StatelessWidget {
  final String day;
  final List<String> times;

  DaySchedule(this.day, this.times);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text("Jam: ",
                  style: GoogleFonts.poppins(fontSize: 13),
                ),
                Text("${times.first} - ${times.last}",
                  style: GoogleFonts.poppins(fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}