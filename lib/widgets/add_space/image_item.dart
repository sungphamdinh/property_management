import 'dart:io';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final imageHeight;
  final File image;
  final Function onDeleteImage;
  ImageItem(this.imageHeight, this.image, this.onDeleteImage);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
          child: Container(
            width: imageHeight,
            height: imageHeight,
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: -15,
          right: -15,
          child: IconButton(
            icon: Icon(
              Icons.cancel,
              color: Colors.white,
            ),
            onPressed: onDeleteImage,
          ),
        )
      ],
    );
  }
}
