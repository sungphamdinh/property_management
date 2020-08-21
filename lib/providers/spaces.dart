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
  List<Space> _searchResults = [];
  List<Space> get spaces => [..._spaces];
  List<Space> get searchResults => [..._searchResults];

  bool _isValidSpace(Space space) {
    return space.postTitle.trim().isNotEmpty;
  }

  Space spaceWithId(String id) {
    return _spaces.firstWhere((space) => space.id == id);
  }

  Future<void> getPlaces() async {
    final snapshots =
        await _fireStore.collection(spacesCollection).getDocuments();
    snapshots.documents.forEach((document) {
      final space = Space.fromJson(document.data);
      space.setId(document.documentID);

      if (_isValidSpace(space)) {
        _spaces.add(space);
      }
    });
    notifyListeners();
  }

  void searchByKeyword(String keyTerm) {
    _searchResults = _spaces
        .where((space) =>
            space.postTitle.toLowerCase().contains(keyTerm.toLowerCase()) ||
            space.address.readableAddress
                .toLowerCase()
                .contains(keyTerm.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void clearSearchResult() {
    _searchResults.clear();
    notifyListeners();
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
