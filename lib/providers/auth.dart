import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:property_management/repositories/auth_repository.dart';

class Auth with ChangeNotifier {
  final AuthRepository repository;

  String _userId;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String get userId => _userId;

  Auth({this.repository});

  Future<void> loginWithUser(String email, String password) async {
    _isLoading = true;
    try {
      _userId = await this.repository.signInWithUser(email, password);
      _isLoading = false;
      notifyListeners();
    } on PlatformException catch (error) {
      _isLoading = false;
      notifyListeners();
      throw error;
    }
  }

  Future<void> createUser(
      String email, String password, String username, File image) async {
    _isLoading = true;
    try {
      await this.repository.signUpWithUser(email, username, password, image);
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      throw error;
    }
  }
}
