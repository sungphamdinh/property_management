import 'package:flutter/material.dart';
import 'package:property_management/providers/spaces.dart';
import 'package:property_management/screens/home/widgets/star.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class SpaceDetailScreen extends StatelessWidget {
  static const routeName = "/space-detail";

  @override
  Widget build(BuildContext context) {
    final spaceId = ModalRoute.of(context).settings.arguments;
    final space = Provider.of<Spaces>(context).spaceWithId(spaceId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Space detail"),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: kDefaultMargin, vertical: kDefaultMargin),
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
                      space.postTitle,
                      style: TextStyle(
                          fontSize: kDefaultLargeFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                    Star(
                      starNum: 4.8,
                      textSize: kDefaultLargeFontSize,
                    )
                  ],
                ),
                SizedBox(
                  height: kDefaultMargin / 2,
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
                      space.address.readableAddress,
                      style: TextStyle(fontSize: kDefaultMediumFontSize),
                    )
                  ],
                ),
                SizedBox(
                  height: kDefaultMargin,
                ),
                Text(
                  "\$${space.price.toInt()}/month",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: kDefaultLargeFontSize),
                ),
                SizedBox(
                  height: kDefaultMargin * 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
