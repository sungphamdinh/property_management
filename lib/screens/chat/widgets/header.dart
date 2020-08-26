import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String avatarUrl;
  Header({this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(this.avatarUrl),
        )
      ],
    );
  }
}
