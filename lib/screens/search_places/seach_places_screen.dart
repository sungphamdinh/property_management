import 'package:flutter/material.dart';
import 'package:property_management/screens/search_places/widgets/search_history.dart';
import 'package:property_management/screens/search_places/widgets/search_result_items.dart';
import 'package:property_management/shared/widgets/search_box_input.dart';

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
              topHeader(_searchTerm),
              SizedBox(
                height: kDefaultMargin * 1.4,
              ),
              Container(
                child: SearchHistory(
                  keywords: [
                    "Quan 22",
                    "Quan 5",
                    "Tan Binh",
                    "Nguyen Van Qua",
                    "Phan Huy Ich"
                  ],
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
                            onPressed: () {},
                          )
                        ],
                      ),
                      Expanded(
                        child: SearchResultItems(
                          data: [
                            "1",
                            "2",
                            "1",
                          ],
                          onPressed: (item) {
                            print(item);
                          },
                        ),
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
              print(value);
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
