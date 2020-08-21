import 'package:flutter/material.dart';

class SearchBoxInput extends StatefulWidget {
  final String value;
  final Function onTab;
  final Function(String value) onValueChange;
  SearchBoxInput({this.onTab, this.onValueChange, this.value});

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
              controller: TextEditingController(text: widget.value),
              onChanged: (value) {
                widget?.onValueChange(value);
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
