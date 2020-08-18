import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'star.dart';

const kImageUrl =
    'https://firebasestorage.googleapis.com/v0/b/flutter-chat-27d8e.appspot.com/o/user_images%2Fimage_picker_67893CF2-3999-4C87-8C12-89F49EB36760-37688-00001C6910C936AA.jpg.jpg?alt=media&token=6361d226-0d21-4571-af21-18bfcbdb9905';

class SpaceItemVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      child: Row(
        children: [
          Container(
            width: 100,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
            child: Image.network(
              kImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: kDefaultMargin,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Plasma X Space",
                    style: TextStyle(
                        fontSize: kDefaultMediumFontSize,
                        fontWeight: FontWeight.bold)),
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
                    Star(starNum: 4)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
