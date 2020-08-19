import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'star.dart';

class SpaceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.8,
      padding: EdgeInsets.all(kDefaultPadding - 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.network(
              kImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: kDefaultMargin / 2,
          ),
          Text(
            "Kaputih Corworking",
            style: TextStyle(
                fontSize: kDefaultMediumFontSize, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: kDefaultMargin / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$2000/month",
                style: TextStyle(
                    color: Colors.lightBlue, fontWeight: FontWeight.bold),
              ),
              Star(
                starNum: 4.8,
              )
            ],
          )
        ],
      ),
    );
  }
}
