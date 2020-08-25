import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/shared/widgets/loading_network_image.dart';
import '../../../shared/widgets/rate_star.dart';

class SpaceItem extends StatelessWidget {
  static const rowHeight = 260.0;

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
              height: MediaQuery.of(context).size.height / 5.2,
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
                RichText(
                    text: TextSpan(
                        text: "\$${this.spacePricePerMonth.toInt()}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        children: [
                      TextSpan(
                          text: " per month",
                          style: TextStyle(
                              color: kTextLightColor,
                              fontWeight: FontWeight.normal))
                    ])),
                RateStar(
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
