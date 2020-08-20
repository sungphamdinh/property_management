import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'Hello, ',
            style: TextStyle(color: Colors.black),
            children: [
          TextSpan(text: 'Sung Pham', style: TextStyle(color: Colors.lightBlue))
        ]));
  }
}
