import 'package:flutter/material.dart';
import 'package:property_management/providers/providers.dart';
import 'package:provider/provider.dart';
import './widgets/widgets.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = "/chats-screen";

  @override
  Widget build(BuildContext context) {
    final friendId = ModalRoute.of(context).settings.arguments;
    final friend =
        Provider.of<Users>(context, listen: false).friendWithId(friendId);

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Header(
            avatarUrl: friend.avatarUrl,
            name: friend.username,
          ),
          Divider()
        ],
      ),
    ));
  }
}
