import 'package:flutter/material.dart';

class SearchResultItems extends StatelessWidget {
  final Function(String item) onPressed;
  final List<String> data;
  SearchResultItems({this.data, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: this.data.length * 5.0,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text("Nguyen Van Qua"),
            subtitle: Text("Quan 12, Ho Chi Minh"),
            onTap: () {
              this.onPressed(this.data[index]);
            },
          );
        },
        itemCount: this.data.length,
      ),
    );
  }
}
