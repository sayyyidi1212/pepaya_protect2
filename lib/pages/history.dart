import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  
  Widget buildCard(String title, String description) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
    );
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
                Text("History Activity",
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
              itemCount: 10, 
              itemBuilder: (context, index) {
                List<String> titles = ["Patrol 1", "Patrol 2", "Patrol 3"];
                List<String> descriptions = ["Post 1 - Blok A", "Post 2 - Blok B", "Post 3 - Blok C"];
                return Card(
                  child: buildCard(titles[index % titles.length], descriptions[index % descriptions.length]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}