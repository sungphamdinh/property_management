import 'package:flutter/material.dart';
import 'package:property_management/models/user.dart';
import '../../../constants.dart';

class Status extends StatelessWidget {
  final UserStatus status;
  Status({this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color:
                  this.status == UserStatus.Active ? Colors.green : Colors.red),
        ),
        SizedBox(
          width: kDefaultMargin / 2,
        ),
        Text(this.status == UserStatus.Active ? "Active" : "In Active")
      ],
    );
  }
}
