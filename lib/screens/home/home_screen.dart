import 'package:flutter/material.dart';
import 'package:property_management/screens/home/widgets/search_box_input.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        text: 'Hello, ',
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: 'Sung Pham',
                          style: TextStyle(color: Colors.lightBlue))
                    ])),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Want to find great place to live?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                SearchBoxInput(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommendation",
                      style: TextStyle(fontSize: 16),
                    ),
                    FlatButton(
                      child: Text("View all"),
                      textColor: Colors.blue,
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
