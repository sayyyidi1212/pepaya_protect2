import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_track_mobile/core/models/schedule.dart';
import 'package:patrol_track_mobile/core/services/schedule_service.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<SchedulePage> {
  List<Schedule> schedules = [];
  bool isLoading = true;

  void fetchSchedules() async {
    try {
      final result = await ScheduleService.fetchSchedules();
      setState(() {
        schedules = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSchedules();
  }

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
                  padding: const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 10),
                ),
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
            child: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
              itemCount: schedules.length,
              itemBuilder: (context, index) {
                final schedule = schedules[index];
                return DaySchedule(schedule);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DaySchedule extends StatelessWidget {
  final Schedule schedule;

  DaySchedule(this.schedule);

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
            Row(
              children: [
                Icon(
                  Icons.date_range_sharp,
                  color: Colors.black,
                ),
                SizedBox(width: 8),
                Text("${schedule.day}",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text("Jam: ",
                  style: GoogleFonts.poppins(fontSize: 13),
                ),
                Text(
                  "${schedule.startTime} - ${schedule.endTime}",
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
