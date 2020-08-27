import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/providers/base_provider.dart';
import 'package:property_management/providers/providers.dart';
import 'package:property_management/screens/chat/chat_screen.dart';
import 'package:property_management/screens/messages/widgets/friend_row.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<Users>(context, listen: false).getFriends();
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
                child: Consumer<Users>(
                  builder: (ctx, users, child) {
                    if (users.state == ProviderState.Busy) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final friends = users.friends;
                      if (friends != null) {
                        return ListView.builder(
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    ChatScreen.routeName,
                                    arguments: friends[index].id);
                              },
                              child: FriendRow(
                                avatarUrl: friends[index].avatarUrl,
                                displayName: friends[index].username,
                                lastMessage: "Remmember Me",
                                lastMessageCreatedTime: "1 hour ago",
                              ),
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
                )),
          )
        ],
      ),
    );
  }
}
