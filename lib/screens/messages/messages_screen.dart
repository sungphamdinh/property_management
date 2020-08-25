import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/models/user.dart';
import 'package:property_management/providers/providers.dart';
import 'package:property_management/screens/messages/widgets/friend_row.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Future<List<User>> getFriendFuture;

  @override
  void initState() {
    super.initState();
    getFriendFuture = Provider.of<Users>(context, listen: false).getFriends();
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
              child: FutureBuilder<List<User>>(
                future: getFriendFuture,
                builder: (ctx, friendsSnapshot) {
                  if (friendsSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final friends = friendsSnapshot.data;
                    if (friends != null) {
                      return ListView.builder(
                        itemBuilder: (ctx, index) {
                          return FriendRow(
                            avatarUrl: friends[index].avatarUrl,
                            displayName: friends[index].username,
                            lastMessage: "Remmember Me",
                            lastMessageCreatedTime: "1 hour ago",
                          );
                        },
                        itemCount: friends.length,
                      );
                    } else {
                      return Center(
                        child: Text("No friends"),
                      );
                    }
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
