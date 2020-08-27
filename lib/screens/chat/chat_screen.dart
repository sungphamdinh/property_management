import 'package:flutter/material.dart';
import 'package:property_management/models/message.dart';
import 'package:property_management/providers/messages.dart';
import 'package:provider/provider.dart';

import './widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = "/chats-screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
            child: Container(
              color: Colors.white,
              child: StreamBuilder<List<Message>>(
                stream:
                    Provider.of<Messages>(context, listen: false).getMessages(),
                builder: (ctx, snapshots) {
                  if (snapshots.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final messages = snapshots.data;
                    if (messages == null || messages.length == 0)
                      return Container();
                    return ListView.builder(
                      itemBuilder: (ctx, index) {
                        return MessageBubble(
                          message: messages[index].content,
                          username: "Sung Pham",
                          // isMe: messages[index].receiverId == friendId,
                          isMe: index % 2 == 0,
                          time: messages[index].getCreatedDateByHour(),
                          avatarUrl:
                              "https://firebasestorage.googleapis.com/v0/b/flutter-chat-27d8e.appspot.com/o/user_images%2FB06dicjY54V9MursatSs6FCZMmI3.jpg?alt=media&token=aa0b4abe-317e-4ae4-8cea-28ccd441c1df",
                        );
                      },
                      itemCount: messages.length,
                    );
                  }
                },
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ChatInput(
                onSendMessage: (content) {
                  Provider.of<Messages>(context, listen: false)
                      .sendMessage(content, friendId);
                },
              ))
        ],
      ),
    ));
  }
}
