import 'package:flutter/material.dart';
import 'package:property_management/screens/home/widgets/star.dart';
import '../../constants.dart';

class SpaceDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: kDefaultMargin * 2, vertical: kDefaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDefaultPadding / 2)),
                  child: Image.network(
                    kImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: kDefaultMargin,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kaputil \nCoworking",
                      style: TextStyle(
                          fontSize: kDefaultSupperLargeFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                    Star(
                      starNum: 4.8,
                      textSize: kDefaultLargeFontSize,
                    )
                  ],
                ),
                SizedBox(
                  height: kDefaultMargin,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.pin_drop,
                      color: kTextLightColor,
                    ),
                    SizedBox(
                      width: kDefaultMargin / 2,
                    ),
                    Text(
                      "Providence, RI 02912, United States",
                      style: TextStyle(fontSize: kDefaultMediumFontSize),
                    )
                  ],
                ),
                SizedBox(
                  height: kDefaultMargin * 2,
                ),
                Text(
                  "\$20.00/month",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: kDefaultSupperLargeFontSize * 0.8),
                ),
                SizedBox(
                  height: kDefaultMargin,
                ),
                Text(
                  "Map View",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: kDefaultSupperLargeFontSize * 0.8),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
