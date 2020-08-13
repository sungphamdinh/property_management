import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/messages/messages.dart';
import '../widgets/messages/send_message.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Chat'),
        actions: <Widget>[
          DropdownButton(
            underline: Container(),
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.exit_to_app,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text('Logout')
                  ],
                ),
                value: "log_out",
              )
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'log_out') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Messages(),
            ),
            SendMessage()
          ],
        ),
      ),
    );
  }
}
