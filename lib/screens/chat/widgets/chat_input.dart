import 'package:flutter/material.dart';
import '../../../constants.dart';

class ChatInput extends StatefulWidget {
  final Function(String content) onSendMessage;
  ChatInput({this.onSendMessage});

  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

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
                focusNode: _focusNode,
                controller: _textController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: kDefaultPadding / 2),
                    hintText: "Type your messages",
                    border: InputBorder.none),
              ),
            )),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            if (_textController.text.trim().isNotEmpty) {
              widget?.onSendMessage(_textController.text);
              _textController.text = '';
              _focusNode.unfocus();
            }
          },
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
