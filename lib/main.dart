import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patrol_track_mobile/pages/splash_screen.dart';
import 'package:patrol_track_mobile/routes/route_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:patrol_track_mobile/pages/menu_nav.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting("id_ID", null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Patrol Track',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home:MenuNav(),
      defaultTransition: Transition.rightToLeft,
      getPages: RouteApp.pages,
    );
  }
}