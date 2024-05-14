import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:patrol_track_mobile/core/models/user.dart';
import 'package:patrol_track_mobile/core/utils/Constant.dart';


class AuthService {
  static Future<User?> login(String email, String password) async {
    final url = Uri.parse('${Constant.BASE_URL}/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return User.fromJson(result['data']);
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }
}
