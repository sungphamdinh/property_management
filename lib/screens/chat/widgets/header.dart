import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/models/user.dart';
import 'package:property_management/screens/chat/widgets/status.dart';

class Header extends StatelessWidget {
  final String avatarUrl;
  final String name;
  Header({this.avatarUrl, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: kDefaultMargin / 2),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            width: kDefaultMargin / 2,
          ),
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(this.avatarUrl),
          ),
          SizedBox(
            width: kDefaultMargin,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.name,
                style: TextStyle(
                    fontSize: kDefaultMediumFontSize,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: kDefaultMargin / 2,
              ),
              Status(
                status: UserStatus.InActive,
              )
            ],
          )
        ],
      ),
    );
  }
}
