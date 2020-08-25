import 'dart:core';
import 'package:property_management/models/user.dart';

abstract class UsersRepository {
  Future<User> userWithId(String userId);
}
