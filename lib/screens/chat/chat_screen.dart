import 'package:flutter/material.dart';
import './widgets/widgets.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = "/chats-screen";

  @override
  Widget build(BuildContext context) {
    final friendId = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [Header()],
      ),
    ));
  }
}
