import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(kDefaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton.icon(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: Icon(Icons.keyboard_return),
                  label: Text("Log Out"))
            ],
          ),
        ),
      ),
    );
  }
}
