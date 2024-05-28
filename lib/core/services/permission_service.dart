import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:patrol_track_mobile/core/utils/constant.dart';

class PermissionService {
  
  static Future<bool> postPermission(String token, String date, String reason, List<String> imagePaths) async {
    final url = Uri.parse('${Constant.BASE_URL}/permission');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token'
      },
      body: jsonEncode({
        'permission_date': date,
        'reason': reason,
        'information': imagePaths,
      }),
    );

    if (response.statusCode == 201) {
      final result = jsonDecode(response.body);
      return result;
    } else {
      final errorResult = jsonDecode(response.body);
      throw '${errorResult['message'] ?? 'Unknown error occurred'}';
    }
  }
}
