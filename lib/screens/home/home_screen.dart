import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/providers/spaces.dart';
import 'package:property_management/screens/all_spaces/all_spaces.dart';
import 'package:property_management/screens/search_places/seach_places_screen.dart';
import 'package:property_management/shared/widgets/search_box_input.dart';
import 'package:property_management/screens/space_detail/space_detail.dart';
import 'package:provider/provider.dart';

import '../add_space/add_space_screen.dart';
import './widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<Spaces>(context, listen: false).getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 60),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(AddSpaceScreen.routeName);
          },
        ),
      ),
      body: SafeArea(
        bottom: false,
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
                  "Want to find",
                  style: TextStyle(
                      fontSize: kDefaultSupperLargeFontSize,
                      fontWeight: FontWeight.bold),
                ),
                Text("a great place to live?",
                    style: TextStyle(
                        fontSize: kDefaultSupperLargeFontSize,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: kDefaultMargin,
                ),
                SearchBoxInput(
                  onTab: () {
                    Navigator.of(context)
                        .pushNamed(SearchPlacesScreen.routeName);
                  },
                ),
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
                      onPressed: () {
                        Navigator.of(context).pushNamed(AllSpaces.routeName);
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: kDefaultMargin,
                ),
                Consumer<Spaces>(builder: (ctx, spacesProvider, child) {
                  if (spacesProvider.spaces.length == 0)
                    return Center(
                      child: Text(
                        "No spaces available!",
                        style: TextStyle(fontSize: kDefaultMediumFontSize),
                      ),
                    );
                  return Container(
                    height: SpaceItem.rowHeight,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        final space = spacesProvider.spaces[index];
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: kDefaultPadding - 8),
                          child: SpaceItem(
                            id: space.id,
                            spaceName: space.postTitle,
                            spaceImageUrl: space.imageUrls.first,
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
//                Container(
//                  height: SpaceItemVertical.rowHeight * 3.0,
//                  child: ListView.builder(
//                    physics: NeverScrollableScrollPhysics(),
//                    itemBuilder: (ctx, index) {
//                      return Padding(
//                        padding: const EdgeInsets.only(bottom: 8.0),
//                        child: SpaceItemVertical(),
//                      );
//                    },
//                    itemCount: 3,
//                  ),
//                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
