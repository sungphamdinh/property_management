import 'package:intl/intl.dart';

class Message {
  final String id;
  final String content;
  final String creatorId;
  final String receiverId;
  final int createdDate;

  Message(
      {this.id,
      this.content,
      this.creatorId,
      this.receiverId,
      this.createdDate});

  String getCreatedDateByHour() {
    return DateFormat('HH:mm')
        .format(DateTime.fromMicrosecondsSinceEpoch(this.createdDate));
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        id: "",
        content: json['content'],
        creatorId: json['creator_id'],
        receiverId: json['receiver_id'],
        createdDate: json['created_date']);
  }

  Map<String, dynamic> toJson() {
    return {
      'content': this.content,
      'creator_id': this.creatorId,
      'receiver_id': this.receiverId,
      'created_date': this.createdDate
    };
  }
}
