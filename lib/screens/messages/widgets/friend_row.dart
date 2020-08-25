import 'package:flutter/material.dart';

import '../../../constants.dart';

class FriendRow extends StatelessWidget {
  final String avatarUrl;
  final String displayName;
  final String lastMessage;
  final String lastMessageCreatedTime;

  const FriendRow(
      {Key key,
      this.avatarUrl,
      this.displayName,
      this.lastMessage,
      this.lastMessageCreatedTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding / 2),
      margin: EdgeInsets.only(bottom: kDefaultMargin / 3),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            minRadius: 30,
            backgroundImage: NetworkImage(this.avatarUrl),
          ),
          SizedBox(
            width: kDefaultMargin,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.displayName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: kDefaultMargin / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    this.lastMessage,
                    style: TextStyle(color: kTextLightColor),
                  ),
                  SizedBox(
                    width: kDefaultMargin / 3,
                  ),
                  Text(this.lastMessageCreatedTime,
                      style: TextStyle(
                          color: kTextColor, fontSize: kDefaultSmallFontSize))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
