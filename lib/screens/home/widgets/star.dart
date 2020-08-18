import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';

class Star extends StatelessWidget {
  final double starNum;
  Star({this.starNum});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        SizedBox(
          width: kDefaultMargin / 3,
        ),
        Text(
          '$starNum',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
