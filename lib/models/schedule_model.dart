class ScheduleModel {
  String id;
  String eventId;
  String eventDate;
  String reminderDate;
  DateTime createdAt;
  DateTime updatedAt;

  ScheduleModel({
    required this.id,
    required this.eventId,
    required this.eventDate,
    required this.reminderDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['id'].toString(),
      eventId: json['event_id'].toString(),
      eventDate: json['event_date'],
      reminderDate: json['reminder_date'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event_id': eventId,
      'event_date': eventDate,
      'reminder_date': reminderDate,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
