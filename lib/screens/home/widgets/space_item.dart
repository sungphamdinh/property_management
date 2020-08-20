import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/shared/widgets/loading_network_image.dart';
import 'star.dart';

class SpaceItem extends StatelessWidget {
  final String id;
  final String spaceName;
  final String spaceImageUrl;
  final double spacePricePerMonth;
  final double spaceStart;
  final Function onItemPressed;
  SpaceItem(
      {@required this.id,
      @required this.spaceName,
      @required this.spaceImageUrl,
      @required this.spacePricePerMonth,
      @required this.spaceStart,
      this.onItemPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onItemPressed,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.8,
        padding: EdgeInsets.all(kDefaultPadding - 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5.8,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Hero(
                tag: id,
                child: LoadingNetworkImage(
                  url: this.spaceImageUrl,
                ),
              ),
            ),
            SizedBox(
              height: kDefaultMargin / 2,
            ),
            Text(
              this.spaceName,
              style: TextStyle(
                  fontSize: kDefaultMediumFontSize,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: kDefaultMargin / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${this.spacePricePerMonth.toInt()}/month",
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
      ),
    );
  }
}
