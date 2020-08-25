import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/data/users_firebase_storage.dart';
import 'package:property_management/repositories/users_repository.dart';
import 'package:property_management/screens/messages/widgets/friend_row.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chats",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: kBackgroundColor,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.black,
          )
        ],
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
                  return FriendRow(
                    avatarUrl:
                        "https://gravatar.com/avatar/09b4ca6df47be2bc5da3b843b0859ad0?s=400&d=robohash&r=x",
                    displayName: "Sung Pham Dinh",
                    lastMessage: "Remmember Me",
                    lastMessageCreatedTime: "1 hour ago",
                  );
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
