import 'package:flutter/material.dart';
import 'package:property_management/shared/widgets/corner_radius_text.dart';
import 'package:transparent_image/transparent_image.dart';

class SpaceItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String address;
  final double price;

  SpaceItem({this.title, this.imageUrl, this.address, this.price});

  @override
  Widget build(BuildContext context) {
    final priceInt = price.round();

    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imageUrl,
                fit: BoxFit.cover),
            SizedBox(
              height: 12,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              address,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                CornerRadiusText(
                  data: 'Available',
                  backgroundColor: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                CornerRadiusText(
                  data: '$priceInt \$',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
