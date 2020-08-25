import 'package:flutter/material.dart';
import 'package:property_management/providers/history_keywords.dart';
import 'package:property_management/screens/search_places/widgets/history_keyword_item.dart';
import 'package:provider/provider.dart';

class SearchHistory extends StatefulWidget {
  final Function(String item) onPressed;
  SearchHistory({this.onPressed});

  @override
  _SearchHistoryState createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {
  @override
  void initState() {
    super.initState();
    Provider.of<HistoryKeywords>(context, listen: false).getKeywords();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryKeywords>(
      builder: (ctx, provider, child) {
        return Container(
          height: provider.keywords.length == 0 ? 0 : 30,
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return HistoryKeywordItem(
                  keyword: provider.keywords[index],
                  onPressed: this.widget.onPressed);
            },
            itemCount: provider.keywords.length,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
