import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_track_mobile/components/header.dart';

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
          const Header(title: "History Activity"),
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