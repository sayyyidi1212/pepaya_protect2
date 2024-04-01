import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patrol_track_mobile/routes/route_app.dart';
import 'package:patrol_track_mobile/splash_screen.dart';
import 'package:patrol_track_mobile/page/login.dart';
import 'package:patrol_track_mobile/page/otp.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Patrol Track',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Otp(),
      getPages: RouteApp.pages,
    );
  }
}