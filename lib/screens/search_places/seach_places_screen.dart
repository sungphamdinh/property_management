import 'package:flutter/material.dart';
import 'package:property_management/models/space.dart';
import 'package:property_management/providers/spaces.dart';
import 'package:property_management/screens/search_places/widgets/search_history.dart';
import 'package:property_management/screens/search_places/widgets/search_result_items.dart';
import 'package:property_management/shared/widgets/search_box_input.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class SearchPlacesScreen extends StatefulWidget {
  static const routeName = "/search-places";

  @override
  _SearchPlacesScreenState createState() => _SearchPlacesScreenState();
}

class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
  static const cancelBtnWidth = 130;
  String _searchTerm = "";

  void onSearchText(String value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultMargin),
          child: Column(
            children: [
              SizedBox(
                height: kDefaultMargin,
              ),
              topHeader(_searchTerm),
              SizedBox(
                height: kDefaultMargin * 1.4,
              ),
              Container(
                child: SearchHistory(
                  keywords: [],
                  onPressed: (item) {
                    setState(() {
                      _searchTerm = item;
                    });
                  },
                ),
              ),
              SizedBox(
                height: kDefaultMargin,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Results"),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () {
                              Provider.of<Spaces>(context, listen: false)
                                  .clearSearchResult();
                            },
                          )
                        ],
                      ),
                      Consumer<Spaces>(
                        builder: (ctx, spacesProvider, child) {
                          return Expanded(
                            child: SearchResultItems(
                              data: spacesProvider.searchResults,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget topHeader(String initialTerm) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - cancelBtnWidth,
          child: SearchBoxInput(
            value: initialTerm,
            onValueChange: (value) {
              if (value.length > 2) {
                Provider.of<Spaces>(context, listen: false)
                    .searchByKeyword(value);
              }
            },
          ),
        ),
        FlatButton(
          child: Text("Cancel"),
          textColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
