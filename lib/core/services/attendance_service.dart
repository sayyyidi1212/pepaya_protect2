import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:patrol_track_mobile/core/models/attendance.dart';
import 'package:patrol_track_mobile/core/utils/Constant.dart';

class AttendanceService {
  static Future<List<Attendance>> getAllAttendances(String token) async {
    final url = Uri.parse('${Constant.BASE_URL}/history-presence');
    final response = await http.get(
      url,
      headers: {'Authorization': '$token'},
    );
    // print('response status: ${response.statusCode}');
    // print('response body: ${response.body}');

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      // print(result);
      List<Attendance> attendances = List<Attendance>.from(
        result['data'].map(
          (attendances) => Attendance.fromJson(attendances),
        ),
      );
      return attendances;
    } else {
      throw Exception('Failed to load attendances');
    }
  }

  static Future<List<Attendance>> getToday(String token) async {
    final url = Uri.parse('${Constant.BASE_URL}/today-presence');
    final response = await http.get(
      url,
      headers: {'Authorization': '$token'},
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(result);
      List<Attendance> attendances = List<Attendance>.from(
        result['data'].map(
          (attendances) => Attendance.fromJson(attendances),
        ),
      );
      return attendances;
    } else {
      throw 'Failed to load attendance data';
    }
  }
}