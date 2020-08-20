import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/providers/spaces.dart';
import 'package:property_management/screens/home/widgets/search_box_input.dart';
import 'package:property_management/screens/home/widgets/space_item.dart';
import 'package:property_management/screens/home/widgets/space_item_vertical.dart';
import 'package:property_management/screens/space_detail/space_detail.dart';
import 'package:provider/provider.dart';

import '../add_space_screen.dart';
import './widgets/header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFirstOpen = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstOpen) {
      this.isFirstOpen = false;
      Provider.of<Spaces>(context).getPlaces();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddSpaceScreen.routeName);
        },
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(kDefaultMargin),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
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
                Consumer<Spaces>(builder: (ctx, spacesProvider, child) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 3.4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        final space = spacesProvider.spaces[index];
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: kDefaultPadding / 2),
                          child: SpaceItem(
                            spaceName: space.postTitle,
                            spacePricePerMonth: space.price,
                            spaceStart: 4.5,
                            onItemPressed: () {
                              Navigator.of(context).pushNamed(
                                  SpaceDetailScreen.routeName,
                                  arguments: space.id);
                            },
                          ),
                        );
                      },
                      itemCount: spacesProvider.spaces.length,
                    ),
                  );
                }),
                SizedBox(
                  height: kDefaultMargin * 2,
                ),
                Text("Top Pick's",
                    style: TextStyle(
                        fontSize: kDefaultMediumFontSize,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: kDefaultMargin,
                ),
                Container(
                  height: 100 * 8.0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SpaceItemVertical(),
                      );
                    },
                    itemCount: 8,
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
