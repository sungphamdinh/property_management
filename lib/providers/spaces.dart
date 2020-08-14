import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import '../models/space.dart';
import 'package:path/path.dart' as path;

class Spaces with ChangeNotifier {
  final _fireStore = Firestore.instance;
  static const spacesCollection = 'spaces';

  List<Space> _spaces = [];
  List<Space> get spaces => [..._spaces];

  Future<void> getPlaces() async {
    final snapshots =
        await _fireStore.collection(spacesCollection).getDocuments();
    snapshots.documents.map((document) {
      print(document['id']);
    });
  }

  Future<void> createNewSpace(Map<String, dynamic> json) async {
    json['roomType'] = Space.convertRoomType(json['roomType']);

    List<File> images = json['pickedImages'] as List<File>;
    List<String> imageUrls = [];

    await Future.wait(images.map((image) async {
      final imageUrl = await _uploadImage(image);
      imageUrls.add(imageUrl);
    }));

    json.remove('pickedImages');
    json.remove('pickedUtilities');
    json.putIfAbsent('imageUrls', () => imageUrls);

    final documentRef = await _fireStore.collection(spacesCollection).add(json);
    final space = Space.fromJson(json);
    space.setId(documentRef.documentID);

    _spaces.add(space);
    notifyListeners();
  }

  Future<String> _uploadImage(File image) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child(path.basename(image.path) + '.jpg');
    await ref.putFile(image).onComplete;
    final url = await ref.getDownloadURL();
    return url;
  }
}
