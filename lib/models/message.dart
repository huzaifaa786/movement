import 'package:flutter/foundation.dart';

class Message {
  String? message;
  String? messageThreadCode;
  int? messageId;
  int? senderId;
  int? timestamp;
  String? firstName;
  String? lastName;


  Message({
    @required this.messageThreadCode,
    @required this.message,
    @required this.firstName,
    @required this.lastName,
    @required this.messageId,
    @required this.senderId,
    @required this.timestamp,
  });
}
