import 'package:property_management/data/auth_firebase.dart';
import 'package:property_management/data/users_firestore.dart';
import 'package:property_management/locator.dart';
import 'package:property_management/models/user.dart';
import 'package:property_management/providers/base_provider.dart';

class Users extends BaseProvider {
  final _userRepository = getIt.get<UsersFireStore>();
  final _authRepository = getIt.get<AuthFireBase>();

  List<User> _friends = [];
  List<User> get friends => _friends;

  Future<User> getCurrentUser() async {
    final id = await _authRepository.getCurrentUserId();
    return await this._userRepository.userWithId(id);
  }

  Future<User> getUserWithId(String id) async {
    final user = await this._userRepository.userWithId(id);
    return user;
  }

  Future<void> getFriends() async {
    Future.delayed(Duration(milliseconds: 50), () {
      setState(ProviderState.Busy);
    });
    final userId = await this._authRepository.getCurrentUserId();
    _friends = await this._userRepository.getFriends(userId);
    setState(ProviderState.Idle);
  }

  User friendWithId(String id) {
    return _friends.firstWhere((user) => user.id == id);
  }
}
