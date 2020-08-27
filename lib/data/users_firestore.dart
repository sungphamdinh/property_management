import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:property_management/models/user.dart';
import 'package:property_management/repositories/users_repository.dart';

class UsersFireStore implements UsersRepository {
  final _fireStore = Firestore.instance;
  static const COLLECTION_KEY = 'users';

  @override
  Future<User> userWithId(String userId) async {
    final userSnapshot =
        await _fireStore.collection(COLLECTION_KEY).document(userId).get();
    final user = User.fromJson(userSnapshot.data);
    user.id = userSnapshot.documentID;
    return user;
  }

  @override
  Future<List<User>> getFriends(String userId) async {
    List<User> friends = [];
    final user = await userWithId(userId);
    await Future.forEach(user.friends, (item) async {
      final friend = await userWithId(item);
      friend.id = item;
      friends.add(friend);
    });
    return friends;
  }
}
