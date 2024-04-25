import 'package:get/get.dart';
import 'package:patrol_track_mobile/forgot_password.dart';
import 'package:patrol_track_mobile/login.dart';
import 'package:patrol_track_mobile/menu_nav.dart';
import 'package:patrol_track_mobile/otp.dart';
import 'package:patrol_track_mobile/page/presensi.dart';
import 'package:patrol_track_mobile/reset_password.dart';

class RouteApp {
  static final pages = [
    GetPage(name: '/login', page: () => Login()),
    GetPage(name: '/forgot-pass', page: () => ForgotPass()),
    GetPage(name: '/otp', page: () => Otp()),
    GetPage(name: '/reset-pass', page: () => ResetPassword()),
    
    GetPage(name: '/menu-nav', page: () => MenuNav()),
    GetPage(name: '/presensi', page: () => Presensi()),
  ];
}