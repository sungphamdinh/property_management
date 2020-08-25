import 'package:flutter/material.dart';
import 'package:property_management/models/user.dart';
import 'package:property_management/repositories/auth_repository.dart';
import 'package:property_management/repositories/users_repository.dart';

class Users with ChangeNotifier {
  final UsersRepository repository;
  final AuthRepository authRepository;
  Users({this.repository, this.authRepository});

  Future<User> getUserWithId(String id) async {
    final user = await this.repository.userWithId(id);
    return user;
  }

  Future<List<User>> getFriends() async {
    final userId = await this.authRepository.getCurrentUserId();
    final friends = await this.repository.getFriends(userId);
    return friends;
  }
}
