import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Auth with ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loginWithUser(String email, String password) async {
    _isLoading = true;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _isLoading = false;
      notifyListeners();
    } on PlatformException catch (error) {
      _isLoading = false;
      notifyListeners();
      throw error;
    } catch (otherError) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createUser(
      String email, String password, String username, File image) async {
    _isLoading = true;
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final imageUrl = await _uploadAvatarImage(authResult, image);

      await Firestore.instance
          .collection('users')
          .document(authResult.user.uid)
          .setData(
              {'username': username, 'email': email, 'avatar_url': imageUrl});
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      notifyListeners();
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
}
