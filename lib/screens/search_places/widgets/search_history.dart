import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';

class SearchHistory extends StatelessWidget {
  final List<String> keywords;
  final Function(String item) onPressed;

  SearchHistory({this.keywords, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: keywords.length == 0 ? 0 : 30,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              this.onPressed(this.keywords[index]);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              margin: EdgeInsets.symmetric(horizontal: kDefaultMargin / 3),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  this.keywords[index],
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          );
        },
        itemCount: this.keywords.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
