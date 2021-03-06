import 'dart:io';
import 'package:flutter/services.dart';
import 'package:property_management/data/auth_firebase.dart';
import 'package:property_management/locator.dart';
import 'package:property_management/providers/base_provider.dart';

class Auth extends BaseProvider {
  final _authRepository = getIt.get<AuthFireBase>();

  String _userId;
  String get userId => _userId;

  Future<String> getCurrentUserId() async {
    if (_userId == null || _userId.isEmpty) {
      return await _authRepository.getCurrentUserId();
    }
    return _userId;
  }

  Future<void> loginWithUser(String email, String password) async {
    setState(ProviderState.Busy);
    try {
      _userId = await this._authRepository.signInWithUser(email, password);
      setState(ProviderState.Idle);
    } on PlatformException catch (error) {
      setState(ProviderState.Idle);
      throw error;
    }
  }

  Future<void> createUser(
      String email, String password, String username, File image) async {
    setState(ProviderState.Busy);
    try {
      await this
          ._authRepository
          .signUpWithUser(email, username, password, image);
      setState(ProviderState.Idle);
    } catch (error) {
      setState(ProviderState.Idle);
      throw error;
    }
  }
}
