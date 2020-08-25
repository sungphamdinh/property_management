import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:property_management/repositories/auth_repository.dart';

class AuthFireBase implements AuthRepository {
  final _auth = FirebaseAuth.instance;

  @override
  Future<String> signInWithUser(String email, String password) async {
    try {
      final authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return authResult.user.uid;
    } on PlatformException catch (error) {
      throw error;
    }
  }

  @override
  Future<String> signUpWithUser(
      String email, String username, String password, File image) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final imageUrl = await _uploadAvatarImage(authResult, image);
      await Firestore.instance
          .collection('users')
          .document(authResult.user.uid)
          .setData(
              {'username': username, 'email': email, 'avatar_url': imageUrl});
      return authResult.user.uid;
    } catch (error) {
      throw error;
    }
  }

  Future<String> _uploadAvatarImage(AuthResult authResult, File image) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child(authResult.user.uid + '.jpg');
    await ref.putFile(image).onComplete;
    final url = await ref.getDownloadURL();
    return url;
  }

  @override
  Future<String> getCurrentUserId() async {
    final user = await _auth.currentUser();
    return user.uid;
  }
}
