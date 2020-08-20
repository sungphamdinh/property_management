import 'package:flutter/material.dart';
import 'package:property_management/shared/widgets/loading_network_image.dart';
import '../../../constants.dart';
import 'star.dart';

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
            height: 100,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
            child: LoadingNetworkImage(
              url: kImageUrl,
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
                  height: kDefaultMargin,
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
