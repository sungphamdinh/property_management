import 'package:property_management/data/auth_firebase.dart';
import 'package:property_management/data/users_firebase_storage.dart';
import 'package:property_management/locator.dart';
import 'package:property_management/models/user.dart';
import 'package:property_management/providers/base_provider.dart';

class Users extends BaseProvider {
  final userRepository = getIt.get<UsersFirebaseStorage>();
  final authRepository = getIt.get<AuthFireBase>();

  List<User> _friends = [];
  List<User> get friends => _friends;

  Future<User> getUserWithId(String id) async {
    final user = await this.userRepository.userWithId(id);
    return user;
  }

  Future<void> getFriends() async {
    setState(ProviderState.Busy);
    final userId = await this.authRepository.getCurrentUserId();
    _friends = await this.userRepository.getFriends(userId);
    setState(ProviderState.Idle);
  }

  User friendWithId(String id) {
    return _friends.firstWhere((user) => user.id == id);
  }
}
