import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'star.dart';

const kImageUrl =
    'https://firebasestorage.googleapis.com/v0/b/flutter-chat-27d8e.appspot.com/o/user_images%2Fimage_picker_67893CF2-3999-4C87-8C12-89F49EB36760-37688-00001C6910C936AA.jpg.jpg?alt=media&token=6361d226-0d21-4571-af21-18bfcbdb9905';

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
