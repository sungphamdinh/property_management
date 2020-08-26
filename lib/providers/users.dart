import 'package:flutter/material.dart';
import 'package:property_management/data/auth_firebase.dart';
import 'package:property_management/data/users_firebase_storage.dart';
import 'package:property_management/locator.dart';
import 'package:property_management/models/user.dart';

class Users with ChangeNotifier {
  final userRepository = getIt.get<UsersFirebaseStorage>();
  final authRepository = getIt.get<AuthFireBase>();

  Future<User> getUserWithId(String id) async {
    final user = await this.userRepository.userWithId(id);
    return user;
  }

  Future<List<User>> getFriends() async {
    final userId = await this.authRepository.getCurrentUserId();
    final friends = await this.userRepository.getFriends(userId);
    return friends;
  }
}
