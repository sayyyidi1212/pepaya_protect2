import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:patrol_track_mobile/core/utils/Constant.dart';

class ReportService {

  static Future<bool> todayReported(String token) async {
    final url = Uri.parse('${Constant.BASE_URL}/report/today');
    final response = await http.get(
      url,
      headers: {'Authorization': '$token'},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['reported_today'];
    } else {
      throw Exception('Failed to load patrol report. Status code: ${response.statusCode}');
    }
  }
}
