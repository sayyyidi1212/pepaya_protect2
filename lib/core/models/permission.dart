class Permission {
  final String permissionDate;
  final String reason;
  final List<String> information;

  Permission({
    required this.permissionDate,
    required this.reason,
    required this.information,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      permissionDate: json['permission_date'],
      reason: json['reason'],
      information: List<String>.from(json['information']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'permission_date': permissionDate,
      'reason': reason,
      'information': information,
    };
  }
}
