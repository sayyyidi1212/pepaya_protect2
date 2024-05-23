import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_track_mobile/components/history_card.dart';
import 'package:patrol_track_mobile/core/models/user.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _headerHome(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () => Get.toNamed('/permission'),
                  child: Text(
                    "Apply for permission",
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              twoCard("Check In", "06:00 AM", "Go to Work", FontAwesomeIcons.signIn),
              twoCard("Check Out", "02:00 PM", "Go Home", FontAwesomeIcons.signOut),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  TableCalendar(
                    locale: "id_ID",
                    rowHeight: 40,
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    focusedDay: today,
                    firstDay: DateTime.utc(2012),
                    lastDay: DateTime.utc(2040),
                    calendarFormat: CalendarFormat.week,
                    calendarStyle: const CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Color(0xFF356899),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "History Presence",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: GoogleFonts.poppins(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return MyCard(
                  icon: IconType.CheckIn,
                  title: "Check-In Title",
                  subtitle: "Check-In Subtitle",
                  time: "06:00 AM",
                  status: "Done",
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerHome() {
    final User user = Get.arguments as User;

    return Container(
      padding: const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 5),
      decoration: const BoxDecoration(
        color: Color(0xFF356899),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 3, bottom: 3),
                  child: Text(
                    "Welcome Back!",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 25),
                  child: Text('${user.name}',
                    // child: Text('Fanidiya Tasya',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/user_profile.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget twoCard(String title, String time, String subtitle, IconData icon) {
    return GestureDetector(
      onTap: () => Get.toNamed('/presensi'),
      child: Container(
        width: 165,
        height: 134,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF3085FE).withOpacity(0.1),
                        ),
                        child: Icon(icon),
                      ),
                      SizedBox(width: 5),
                      Text(
                        title,
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    time,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
