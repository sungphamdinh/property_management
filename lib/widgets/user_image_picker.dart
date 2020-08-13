import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) pickedImage;
  UserImagePicker({this.pickedImage});
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;

  void _pickImage(ImageSource source) async {
    Navigator.of(context).pop();
    final imagePicker = ImagePicker();
    final imageFile = await imagePicker.getImage(
        source: source, imageQuality: 50, maxWidth: 150);
    final pickedImageFile = File(imageFile.path);

    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.pickedImage(pickedImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
        FlatButton.icon(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.image,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Gallery"),
                          onTap: () => _pickImage(ImageSource.gallery),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.camera,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Camera"),
                          onTap: () => _pickImage(ImageSource.camera),
                        ),
                      ]);
                });
          },
          icon: Icon(Icons.image),
          label: Text('Add image'),
          textColor: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
