import 'package:flutter/material.dart';

import '../../constants.dart';

class ButtonBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: kDefaultMargin / 2, top: kDefaultMargin / 2),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
