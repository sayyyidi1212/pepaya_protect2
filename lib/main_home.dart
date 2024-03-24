import 'package:flutter/material.dart';
import 'page/schedule.dart';
import 'page/history.dart';
import 'page/setting.dart';
import 'page/home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> screens = [
    Home(),
    Schedule(),
    History(),
    Setting(),
  ];

  Widget currentScreen = Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentScreen,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, 
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildTabItem(0, Icons.home, 'Home'),
              _buildTabItem(1, Icons.calendar_month, 'Schedule'),
              SizedBox(width: 40), // Spacer
              _buildTabItem(2, Icons.history, 'History'),
              _buildTabItem(3, Icons.settings, 'Setting'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(int index, IconData icon, String text) {
    return GestureDetector(
      onTap: () => _updateTab(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: currentTab == index ? Colors.blue : Colors.black),
          SizedBox(height: 4), // Vertical spacing
          Text(
            text,
            style: TextStyle(
              color: currentTab == index ? Colors.blue : Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }

  void _updateTab(int index) {
    setState(() {
      currentScreen = screens[index];
      currentTab = index;
    });
  }
}