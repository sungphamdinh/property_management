import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/screens/messages/widgets/friend_row.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: kDefaultMargin / 2,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultMargin),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return FriendRow();
                },
                itemCount: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
