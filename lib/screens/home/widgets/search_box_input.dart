import 'package:flutter/material.dart';

class SearchBoxInput extends StatefulWidget {
  @override
  _SearchBoxInputState createState() => _SearchBoxInputState();
}

class _SearchBoxInputState extends State<SearchBoxInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              hintText: "Enter search term",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}
