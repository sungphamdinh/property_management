import 'package:flutter/material.dart';

import '../../../constants.dart';

class FriendRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding / 2),
      margin: EdgeInsets.only(bottom: kDefaultMargin / 3),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://robohash.org/49b6ec4860811f433382b47123d7e1d7?set=set4&bgset=&size=400x400"),
          ),
          SizedBox(
            width: kDefaultMargin,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sung Pham"),
              SizedBox(
                height: kDefaultMargin / 2,
              ),
              Row(
                children: [
                  Text("Last messages"),
                  SizedBox(
                    width: kDefaultMargin / 3,
                  ),
                  Text("30 min ago")
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
