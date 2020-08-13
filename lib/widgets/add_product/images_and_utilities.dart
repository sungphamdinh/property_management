import 'dart:io';

import '../../models/utility.dart';
import '../../widgets/add_product/image_item.dart';
import '../../widgets/add_product/utility_item.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagesAndUtilities extends StatefulWidget {
  @override
  ImagesAndUtilitiesState createState() => ImagesAndUtilitiesState();
}

class ImagesAndUtilitiesState extends State<ImagesAndUtilities> {
  final double _imageHeight = 60;
  final _pickedImages = [];
  final _utilities = [
    Utility('Private WC', Icons.wc),
    Utility('Parking', Icons.local_parking)
  ];

  Map<String, dynamic> saveUtilitiesAndImages() {
    if (_pickedImages.length < 4) return null;
    return {'pickedImages': _pickedImages, 'pickedUtilities': _utilities};
  }

  void _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final imageFile = await imagePicker.getImage(
        source: source, imageQuality: 50, maxWidth: 150);
    if (imageFile != null) {
      final pickedImageFile = File(imageFile.path);
      setState(() {
        _pickedImages.add(pickedImageFile);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Images",
                style: TextStyle(fontSize: 16),
              ),
              FlatButton(
                child: const Text("Remove All"),
                onPressed: () {},
                textColor: Colors.redAccent,
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Column(
              children: [
                Container(
                  height: _SizeCalculationHelper._getImageGridHeight(
                      _pickedImages.length, _imageHeight),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    itemBuilder: (ctx, index) {
                      return ImageItem(_imageHeight, _pickedImages[index], () {
                        setState(() {
                          _pickedImages.removeAt(index);
                        });
                      });
                    },
                    itemCount: _pickedImages.length,
                  ),
                ),
                const Text(
                  "Post more images",
                  style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                ),
                SizedBox(
                  height: 4,
                ),
                const Text(
                  "Limit at least 4 images, maximum of 20 images and do not exceed over 10mb",
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          FlatButton.icon(
            onPressed: () => _pickImage(ImageSource.gallery),
            icon: Icon(Icons.camera),
            label: Text("Take a picture"),
            textColor: Theme.of(context).accentColor,
          ),
          Row(
            children: [Text("Utilities", style: TextStyle(fontSize: 16))],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height:
                _SizeCalculationHelper.getUtilityGridHeight(_utilities.length),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 3 / 1),
              itemBuilder: (ctx, index) {
                return UtilityItem(_utilities[index].name,
                    _utilities[index].icon, (isSelected) {});
              },
              itemCount: _utilities.length,
            ),
          )
        ],
      ),
    );
  }
}

class _SizeCalculationHelper {
  static double _utilityItemHeight = 60;

  static double getUtilityGridHeight(int itemCount) {
    final delta = _utilityItemHeight;
    final utilitiesCount = itemCount;
    if (utilitiesCount == 0) return _utilityItemHeight;
    if (utilitiesCount % 2 == 0) {
      return utilitiesCount / 2 * delta;
    } else {
      return (utilitiesCount / 2 + 1) * delta;
    }
  }

  static double _getImageGridHeight(int itemCount, double imageHeight) {
    final delta = imageHeight + 40;
    final imagesCount = itemCount;
    if (imagesCount == 0) return imageHeight;
    if (imagesCount % 3 == 0) {
      return imagesCount / 3 * delta + 20;
    } else {
      return (imagesCount / 3 + 1) * delta;
    }
  }
}
