import 'package:flutter/material.dart';

class SearchBoxInput extends StatefulWidget {
  final Function onTab;
  final Function(String value) onSubmitted;
  final Function(String value) onValueChange;
  SearchBoxInput({this.onTab, this.onValueChange, this.onSubmitted});

  @override
  _SearchBoxInputState createState() => _SearchBoxInputState();
}

class _SearchBoxInputState extends State<SearchBoxInput> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTab,
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Center(
          child: IgnorePointer(
            ignoring: widget.onTab == null ? false : true,
            child: TextField(
              onChanged: (value) {
                widget?.onValueChange(value);
              },
              onSubmitted: (value) {
                widget?.onSubmitted(value);
              },
              decoration: InputDecoration(
                  hintText: "Enter search term",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
