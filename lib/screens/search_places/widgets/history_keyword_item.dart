import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/providers/history_keywords.dart';

class HistoryKeywordItem extends StatelessWidget {
  final String keyword;
  final Function(String item) onPressed;
  HistoryKeywordItem({this.keyword, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            this.onPressed(keyword);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            margin: EdgeInsets.symmetric(horizontal: kDefaultMargin / 3),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                keyword,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ),
        Positioned(
          top: -2,
          right: 0,
          child: GestureDetector(
            onTap: () {
              Provider.of<HistoryKeywords>(context, listen: false)
                  .removeKeyword(keyword);
            },
            child: Icon(
              Ionicons.ios_remove_circle,
              size: 16,
              color: Theme.of(context).primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
