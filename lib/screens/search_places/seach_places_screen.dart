import 'package:flutter/material.dart';
import 'package:property_management/shared/widgets/search_box_input.dart';

import '../../constants.dart';

class SearchPlacesScreen extends StatefulWidget {
  static const routeName = "/search-places";

  @override
  _SearchPlacesScreenState createState() => _SearchPlacesScreenState();
}

class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
  static const cancelBtnWidth = 100;
  void onSearchText(String value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    width: MediaQuery.of(context).size.width - cancelBtnWidth,
                    child: SearchBoxInput(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
