import 'package:noobz/models/schedule_model.dart';

class EventModel {
  int id;
  String eventName;
  String eventType;
  String userId;
  List<ScheduleModel> schedule;
  DateTime createdAt;
  DateTime updatedAt;
  String? payment;

  EventModel({
    required this.id,
    required this.eventName,
    required this.eventType,
    required this.userId,
    required this.schedule,
    required this.createdAt,
    required this.updatedAt,
    this.payment,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      eventName: json['event_name'],
      eventType: json['event_type'],
      userId: json['user_id'],
      schedule: List<ScheduleModel>.from(json['schedule'].map((x) => ScheduleModel.fromJson(x))),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      payment: json['payment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event_name': eventName,
      'event_type': eventType,
      'user_id': userId,
      'schedule': schedule.map((s) => s.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'payment': payment,
    };
  }
}