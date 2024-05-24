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
        throw Exception('Silahkan login terlebih dahulu');
      }
    } catch (error) {
      throw Exception('Failed to fetch attendance history: ${error.toString()}');
    }
  }
}
