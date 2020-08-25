import 'dart:async';
import 'dart:io';

abstract class AuthRepository {
  Future<String> signInWithUser(String email, String password);
  Future<String> signUpWithUser(
      String email, String username, String password, File image);
  Future<String> getCurrentUserId();
}
