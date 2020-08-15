import 'package:flutter/material.dart';

class CornerRadiusText extends StatelessWidget {
  final String data;
  final Color textColor;
  final Color backgroundColor;
  CornerRadiusText(
      {this.data,
      this.textColor = Colors.white,
      this.backgroundColor = Colors.pink});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: this.backgroundColor,
      ),
      child: Text(
        data,
        style: TextStyle(color: this.textColor),
      ),
    );
  }
}
