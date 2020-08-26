import 'package:flutter/material.dart';
import '../../../constants.dart';

class ChatInput extends StatefulWidget {
  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 60,
            margin: EdgeInsets.all(kDefaultMargin),
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: kDefaultPadding / 2),
                    hintText: "Type your messages",
                    border: InputBorder.none),
              ),
            )),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {},
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
