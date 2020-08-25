import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/providers/providers.dart';
import 'package:property_management/screens/all_spaces/widgets/space_item_vertical.dart';
import 'package:property_management/screens/space_detail/space_detail_screen.dart';
import 'package:provider/provider.dart';

class AllSpacesScreen extends StatelessWidget {
  static const routeName = "/all-spaces";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: kDefaultMargin,
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Spacer(),
              Container(
                  margin: EdgeInsets.only(right: kDefaultMargin),
                  child: Text("4 Spaces"))
            ],
          ),
          Expanded(
            child: Consumer<Spaces>(
              builder: (ctx, provider, child) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: kDefaultMargin / 2),
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      final space = provider.spaces[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              SpaceDetailScreen.routeName,
                              arguments: space.id);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: kDefaultMargin / 2),
                          child: SpaceItemVertical(
                            spaceName: space.postTitle,
                            spaceImageUrl: space.imageUrls[0],
                            spacePricePerMonth: space.price,
                            spaceStart: 4.5,
                          ),
                        ),
                      );
                    },
                    itemCount: provider.spaces.length,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
