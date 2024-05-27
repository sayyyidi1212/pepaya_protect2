class Report {
  final int id;
  final int guardId;
  final int locationId;
  final String locationName;
  final String status;
  final String description;
  final String attachment;
  final DateTime createdAt;

  Report({
    required this.id,
    required this.guardId,
    required this.locationId,
    required this.locationName,
    required this.status,
    required this.description,
    required this.attachment,
    required this.createdAt,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'],
      guardId: json['guard_id'],
      locationId: json['location_id'],
      locationName: json['location_name'],
      status: json['status'],
      description: json['description'],
      attachment: json['attachment'],
      createdAt: DateTime.parse(json['created_at']).toLocal(),
    );
  }
}