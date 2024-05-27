import 'package:flutter/material.dart';

class ReportModels {
  final int id;
  final int location_id;
  final DateTime created_at;
  final String? status;

  ReportModels({
    required this.id,
    required this.location_id,
    required this.created_at,
    this.status,
  });

  factory ReportModels.fromJson(Map<String, dynamic> json) {
    return ReportModels(
      id: json['id'],
      location_id: json['location_id'],
      created_at: (json['created_at'])!,
      status: json['status'] as String?,
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