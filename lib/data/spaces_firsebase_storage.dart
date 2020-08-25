import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:property_management/models/space.dart';
import 'package:property_management/repositories/spaces_repository.dart';

class SpacesFirebaseStorage implements SpacesRepository {
  final _fireStore = Firestore.instance;
  static const spacesCollection = 'spaces';

  @override
  Future<List<Space>> getSpaces() async {
    List<Space> spaces = [];

    final snapshots =
        await _fireStore.collection(spacesCollection).getDocuments();
    snapshots.documents.forEach((document) {
      final space = Space.fromJson(document.data);
      space.setId(document.documentID);
      spaces.add(space);
    });

    return spaces;
  }

  @override
  Future<Space> createNewSpace(Map<String, dynamic> json) async {
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

    return space;
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
