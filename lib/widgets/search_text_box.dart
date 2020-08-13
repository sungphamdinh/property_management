import 'package:flutter/material.dart';

class SearchTextBox extends StatefulWidget {
  final void Function(String searchTerm) onSearchText;
  SearchTextBox(this.onSearchText);

  @override
  _SearchTextBoxState createState() => _SearchTextBoxState();
}

class _SearchTextBoxState extends State<SearchTextBox> {
  var _areaName = 'HCM';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      height: 44,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey[300]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton.icon(
            onPressed: () {},
            icon: Icon(Icons.pin_drop),
            label: Text(_areaName),
            textColor: Theme.of(context).primaryColor,
          ),
          Container(
            margin: EdgeInsets.only(right: 4),
            width: MediaQuery.of(context).size.width - 120,
            child: TextFormField(
              decoration: InputDecoration(border: InputBorder.none),
              onChanged: (value) {
                widget.onSearchText(value);
              },
            ),
          )
        ],
      ),
    );
  }
}
