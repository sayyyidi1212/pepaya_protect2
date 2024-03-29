import 'package:get/get.dart';
import 'package:patrol_track_mobile/forgot_password.dart';
import 'package:patrol_track_mobile/login.dart';
import 'package:patrol_track_mobile/menu_nav.dart';

class RouteApp {
  static final pages = [
    GetPage(name: '/login', page: () => Login()),
    GetPage(name: '/forgot-pass', page: () => ForgotPass()),
    GetPage(name: '/menu-nav', page: () => MenuNav()),
  ];
}