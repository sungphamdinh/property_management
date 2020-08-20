import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';

class RateStar extends StatelessWidget {
  final double starNum;
  final double textSize;
  RateStar({this.starNum, this.textSize});

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
          style: TextStyle(
              color: Colors.grey,
              fontSize: this.textSize ?? kDefaultMediumFontSize),
        )
      ],
    );
  }
}
