import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/providers/history_keywords.dart';
import 'package:property_management/screens/search_places/widgets/history_keyword_item.dart';
import 'package:provider/provider.dart';

class SearchHistory extends StatelessWidget {
  final Function(String item) onPressed;

  SearchHistory({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: Provider.of<HistoryKeywords>(context).getKeywords(),
      builder: (ctx, keywordsSnapshot) {
        if (keywordsSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final keywords = keywordsSnapshot.data;
          if (keywords.length != 0) {
            return Container(
              height: keywords.length == 0 ? 0 : 30,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return HistoryKeywordItem(
                      keyword: keywords[index], onPressed: this.onPressed);
                },
                itemCount: keywords.length,
                scrollDirection: Axis.horizontal,
              ),
            );
          } else {
            return Center(
              child: Text("No search history"),
            );
          }
        }
      },
    );
  }
}
