import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:property_management/constants.dart';
import 'package:property_management/shared/widgets/loading_network_image.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<String> imageUrls;
  final String id;
  CarouselWithIndicator({this.imageUrls, this.id});

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  List<Widget> imageWidgets() {
    if (widget.imageUrls == null || widget.imageUrls.length == 0) return [];
    return widget.imageUrls.map((imageUrl) {
      return LoadingNetworkImage(
        url: imageUrl,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: widget.id,
          child: CarouselSlider(
            items: imageWidgets(),
            options: CarouselOptions(
                height: 220,
                initialPage: 0,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        SizedBox(
          height: kDefaultMargin,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageUrls.map((url) {
            int index = widget.imageUrls.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
