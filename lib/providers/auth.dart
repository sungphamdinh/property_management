import 'dart:io';
import 'package:flutter/services.dart';
import 'package:property_management/providers/base_provider.dart';
import 'package:property_management/repositories/auth_repository.dart';

class Auth extends BaseProvider {
  final AuthRepository repository;

  String _userId;
  String get userId => _userId;

  Auth({this.repository});

  Future<void> loginWithUser(String email, String password) async {
    setState(ProviderState.Busy);
    try {
      _userId = await this.repository.signInWithUser(email, password);
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
      await this.repository.signUpWithUser(email, username, password, image);
      setState(ProviderState.Idle);
    } catch (error) {
      setState(ProviderState.Idle);
      throw error;
    }
  }
}
