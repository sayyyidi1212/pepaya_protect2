import 'package:flutter/material.dart';
import 'package:patrol_track_mobile/core/models/attendance.dart';
import 'package:patrol_track_mobile/core/services/attendance_service.dart';
import 'package:patrol_track_mobile/core/utils/constant.dart';

class AttendanceController {
  static Future<List<Attendance>> getAttendanceHistory(BuildContext context) async {
    try {
      String? token = await Constant.getToken();

      if (token != null) {
        List<Attendance> attendances = await AttendanceService.getAllAttendances(token);
        return attendances;
      } else {
        throw Exception('Please login first.');
      }
    } catch (error) {
      throw Exception('Failed to fetch attendance history: ${error.toString()}');
    }
  }

  static Future<List<Attendance>> getToday(BuildContext context) async {
    try {
      String? token = await Constant.getToken();

      if (token != null) {
        List<Attendance> attendances = await AttendanceService.getToday(token);
        return attendances;
      } else {
        throw Exception('Please login first.');
      }
    } catch (error) {
      print('Failed to fetch attendance today: ${error.toString()}');
      throw 'Failed to fetch attendance today: ${error.toString()}';
    }
  }
}
