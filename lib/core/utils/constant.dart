import 'package:shared_preferences/shared_preferences.dart';

class Constant {
  static const String BASE_URL = 'http://10.0.2.2:8000/api';
  // static const String BASE_URL = 'http://patroltrack.my.id/api';

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}  