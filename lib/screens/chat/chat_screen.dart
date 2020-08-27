import 'dart:async';

import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/models/message.dart';
import 'package:property_management/models/user.dart';
import 'package:property_management/providers/messages.dart';
import 'package:property_management/providers/users.dart';
import 'package:provider/provider.dart';

import './widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = "/chats-screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final friendId = ModalRoute.of(context).settings.arguments;
    final friend =
        Provider.of<Users>(context, listen: false).friendWithId(friendId);

    Timer(
      Duration(seconds: 1),
      () => _controller.animateTo(_controller.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.ease),
    );

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Header(
            avatarUrl: friend.avatarUrl,
            name: friend.username,
          ),
          Divider(),
          Expanded(
            child: Container(
              color: Colors.white,
              child: FutureBuilder<User>(
                future: Provider.of<Users>(context).getCurrentUser(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final currentUser = snapshot.data;
                    return StreamBuilder<List<Message>>(
                      stream: Provider.of<Messages>(context, listen: false)
                          .getMessages(currentUser.id),
                      builder: (ctx, snapshots) {
                        if (snapshots.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final messages = snapshots.data;
                          if (messages == null || messages.length == 0)
                            return Container();
                          return ListView.builder(
                            controller: _controller,
                            itemBuilder: (ctx, index) {
                              final isMe =
                                  messages[index].creatorId == currentUser.id;

                              return Container(
                                margin:
                                    EdgeInsets.only(bottom: kDefaultMargin / 3),
                                child: MessageBubble(
                                    message: messages[index].content,
                                    username: isMe
                                        ? currentUser.username
                                        : friend.username,
                                    isMe: isMe,
                                    time:
                                        messages[index].getCreatedDateByHour(),
                                    avatarUrl: isMe
                                        ? currentUser.avatarUrl
                                        : friend.avatarUrl),
                              );
                            },
                            itemCount: messages.length,
                          );
                        }
                      },
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
