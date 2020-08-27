import 'package:intl/intl.dart';

class Message {
  final String id;
  final String content;
  final String creatorId;
  final String receiverId;
  final DateTime createdDate;

  Message(
      {this.id,
      this.content,
      this.creatorId,
      this.receiverId,
      this.createdDate});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        id: "",
        content: json['content'],
        creatorId: json['creator_id'],
        receiverId: json['receiver_id'],
        createdDate: DateFormat().parse(json['created_date']));
  }

  Map<String, dynamic> toJson() {
    return {
      'content': this.content,
      'creator_id': this.creatorId,
      'receiver_id': this.receiverId,
      'created_date': DateFormat().format(this.createdDate).toString()
    };
  }
}
