import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SpaceItem extends StatelessWidget {
  final String id;
  final String title;
  final String address;
  final double price;
  final String featureImageUrl;
  SpaceItem(
      this.id, this.title, this.address, this.price, this.featureImageUrl);

  @override
  Widget build(BuildContext context) {
    final readablePrice = NumberFormat.compact().format(price);
    return GridTile(
      header: Container(
          color: Colors.white,
          padding: EdgeInsets.all(4),
          child: Text("$readablePrice VND/Room",
              style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold))),
      child: Image.network(
        featureImageUrl,
        fit: BoxFit.cover,
      ),
      footer: Container(
        color: Colors.white,
        padding: EdgeInsets.all(4),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              address,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
