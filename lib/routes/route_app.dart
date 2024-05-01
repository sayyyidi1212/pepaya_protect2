import 'package:get/get.dart';
import 'package:patrol_track_mobile/forgot_password.dart';
import 'package:patrol_track_mobile/login.dart';
import 'package:patrol_track_mobile/menu_nav.dart';
import 'package:patrol_track_mobile/otp.dart';
import 'package:patrol_track_mobile/page/help_center.dart';
import 'package:patrol_track_mobile/page/permission.dart';
import 'package:patrol_track_mobile/page/presensi.dart';
import 'package:patrol_track_mobile/page/scanner.dart';
import 'package:patrol_track_mobile/reset_password.dart';

class RouteApp {
  static final pages = [
    GetPage(name: '/login', page: () => Login()),
    GetPage(name: '/forgot-pass', page: () => ForgotPass()),
    GetPage(name: '/otp', page: () => Otp()),
    GetPage(name: '/reset-pass', page: () => ResetPassword()),
    
    GetPage(name: '/menu-nav', page: () => MenuNav()),
    GetPage(name: '/presensi', page: () => Presensi()),
<<<<<<< HEAD
    GetPage(name: '/help-center', page: () => HelpCenter()),
    GetPage(name: '/permission', page: () => Permission()),
=======
    GetPage(name: '/scanner', page: () => Scanner()),
    GetPage(name: '/help-center', page: () => HelpCenter())
>>>>>>> 72cd12d67fd52b25e7db94cf6af4f99059cfaecd
  ];
}