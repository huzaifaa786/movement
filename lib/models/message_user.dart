import 'package:flutter/foundation.dart';

class MessageUser {
  String? threadCode;
  int? instructorId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  int? countUnread;
  String? lastMessage;
  int? lastMessageTimestamp;

  MessageUser({
    @required this.threadCode,
    @required this.instructorId,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.imageUrl,
    @required this.countUnread,
    @required this.lastMessage,
    @required this.lastMessageTimestamp,
  });
}
