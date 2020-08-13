import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String username;
  final bool isMe;
  final Key key;
  MessageBubble({this.message, this.username, this.isMe, this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          this.isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: this.isMe
                  ? Theme.of(context).accentColor
                  : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft:
                    this.isMe ? Radius.circular(0) : Radius.circular(12),
                bottomRight:
                    !this.isMe ? Radius.circular(0) : Radius.circular(12),
              )),
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.start : MainAxisAlignment.end,
              children: <Widget>[
                Text(username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                Text(
                  message,
                  style: TextStyle(
                      color: Theme.of(context).accentTextTheme.headline1.color),
                  textAlign: isMe ? TextAlign.end : TextAlign.start,
                )
              ]),
        )
      ],
    );
  }
}
