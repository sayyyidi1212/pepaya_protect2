import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:patrol_track_mobile/core/models/report.dart';
import 'package:patrol_track_mobile/core/utils/Constant.dart';

class ReportService {
  static Future<bool> todayReported(String token) async {
    final url = Uri.parse('${Constant.BASE_URL}/today-report');
    final response = await http.get(
      url,
      headers: {'Authorization': '$token'},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['reported_today'];
    } else {
      throw Exception(
          'Failed to load patrol report. Status code: ${response.statusCode}');
    }
  }

  static Future<List<Report>> getAllReports(String token) async {
    final url = Uri.parse('${Constant.BASE_URL}/history-report');
    final response = await http.get(
      url,
      headers: {'Authorization': '$token'},
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      // print(result);
      List<Report> reports = List<Report>.from(
        result['data'].map(
          (reports) => Report.fromJson(reports),
        ),
      );
      return reports;
    } else {
      throw Exception('Failed to load reports');
    }
  }
}
