import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String username;
  final String avatarUrl;
  final String time;
  final bool isMe;
  final Key key;
  MessageBubble(
      {this.message,
      this.username,
      this.avatarUrl,
      this.time,
      this.isMe,
      this.key})
      : super(key: key);

  static const borderRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          this.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: kDefaultMargin / 3,
        ),
        this.isMe
            ? SizedBox()
            : CircleAvatar(
                backgroundImage: NetworkImage(this.avatarUrl),
              ),
        SizedBox(
          width: kDefaultMargin / 2,
        ),
        Container(
          margin: EdgeInsets.only(right: this.isMe ? kDefaultMargin / 3 : 0),
          child: Column(
            crossAxisAlignment:
                this.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              this.isMe
                  ? Text('$time', style: TextStyle(color: Colors.grey))
                  : Text('$username, $time',
                      style: TextStyle(color: Colors.grey)),
              Container(
                  decoration: BoxDecoration(
                      color: this.isMe ? Colors.blue[100] : Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(borderRadius),
                        topLeft: this.isMe
                            ? Radius.circular(borderRadius)
                            : Radius.circular(0),
                        topRight: this.isMe
                            ? Radius.circular(0)
                            : Radius.circular(borderRadius),
                        bottomRight: Radius.circular(borderRadius),
                      )),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text(
                    message,
                    textAlign: this.isMe ? TextAlign.end : TextAlign.start,
                    style: TextStyle(fontSize: kDefaultMediumFontSize),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
