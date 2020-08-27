import 'package:flutter/material.dart';
import 'package:property_management/providers/messages.dart';
import 'package:property_management/screens/chat/widgets/chat_input.dart';
import 'package:provider/provider.dart';
import './widgets/widgets.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = "/chats-screen";

  @override
  Widget build(BuildContext context) {
    final friendId = ModalRoute.of(context).settings.arguments;
    // final friend =
    //     Provider.of<Users>(context, listen: false).friendWithId(friendId);

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Header(
            avatarUrl:
                "https://firebasestorage.googleapis.com/v0/b/flutter-chat-27d8e.appspot.com/o/user_images%2FB06dicjY54V9MursatSs6FCZMmI3.jpg?alt=media&token=aa0b4abe-317e-4ae4-8cea-28ccd441c1df",
            name: 'Sung Pham',
          ),
          Divider(),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: ChatInput(
                  onSendMessage: (content) {
                    Provider.of<Messages>(context, listen: false)
                        .sendMessage(content, friendId);
                  },
                )),
          )
        ],
      ),
    ));
  }
}
