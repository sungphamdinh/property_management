import 'package:flutter/material.dart';
import 'package:property_management/shared/widgets/loading_network_image.dart';
import '../../../constants.dart';
import '../../../shared/widgets/rate_star.dart';

class SpaceItemVertical extends StatelessWidget {
  final String spaceName;
  final String spaceImageUrl;
  final double spacePricePerMonth;
  final double spaceStart;

  static const rowHeight = 130.0;

  const SpaceItemVertical(
      {Key key,
      this.spaceName,
      this.spaceImageUrl,
      this.spacePricePerMonth,
      this.spaceStart})
      : super(key: key);

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
              url: this.spaceImageUrl,
            ),
          ),
          SizedBox(
            width: kDefaultMargin,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 210,
                child: Text(this.spaceName,
                    style: TextStyle(
                        fontSize: kDefaultMediumFontSize,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: kDefaultMargin,
              ),
              Text(
                "\$${this.spacePricePerMonth}/month",
                style: TextStyle(
                    color: Colors.lightBlue, fontWeight: FontWeight.bold),
              ),
              RateStar(starNum: this.spaceStart)
            ],
          )
        ],
      ),
    );
  }
}
