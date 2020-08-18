import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/screens/home/widgets/search_box_input.dart';
import 'package:property_management/screens/home/widgets/space_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(kDefaultMargin),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        text: 'Hello, ',
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: 'Sung Pham',
                          style: TextStyle(color: Colors.lightBlue))
                    ])),
                SizedBox(
                  height: kDefaultMargin,
                ),
                Text(
                  "Want to find great place to live?",
                  style: TextStyle(
                      fontSize: kDefaultSupperLargeFontSize,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: kDefaultMargin,
                ),
                SearchBoxInput(),
                SizedBox(
                  height: kDefaultMargin,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommendation",
                      style: TextStyle(
                          fontSize: kDefaultMediumFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                    FlatButton(
                      child: Text("View all"),
                      textColor: Colors.blue,
                      onPressed: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: kDefaultMargin,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3.7,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(right: kDefaultPadding / 2),
                        child: SpaceItem(),
                      );
                    },
                    itemCount: 6,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}