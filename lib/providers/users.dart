import 'package:flutter/material.dart';
import 'package:property_management/models/user.dart';
import 'package:property_management/repositories/users_repository.dart';

class Users with ChangeNotifier {
  final UsersRepository repository;
  Users({this.repository});

  Future<User> getUserWithId(String id) async {
    final user = await this.repository.userWithId(id);
    return user;
  }
}
