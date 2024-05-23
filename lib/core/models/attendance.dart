import 'package:flutter/material.dart';

class Attendance {
  final int id;
  final DateTime date;
  final TimeOfDay? checkIn;
  final TimeOfDay? checkOut;
  final String status;

  Attendance({
    required this.id,
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.status,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      id: json['id'],
      date: DateTime.parse(json['date']),
      checkIn: json['check_in_time'] != null ? _parseTimeOfDay(json['check_in_time']) : null,
      checkOut: json['check_out_time'] != null ? _parseTimeOfDay(json['check_out_time']) : null,
      status: json['status'],
    );
  }

  static TimeOfDay? _parseTimeOfDay(String? timeString) {
    if (timeString != null) {
      final parts = timeString.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      return TimeOfDay(hour: hour, minute: minute);
    }
    return null;
  }
}