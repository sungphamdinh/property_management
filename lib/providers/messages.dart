import 'package:flutter/foundation.dart';
import 'package:property_management/data/auth_firebase.dart';
import 'package:property_management/data/messages_firestore.dart';
import 'package:property_management/locator.dart';

class Messages with ChangeNotifier {
  final _messagesRepository = getIt.get<MessagesFireStore>();
  final _authRepository = getIt.get<AuthFireBase>();

  Future<void> sendMessage(String content, String receiverId) async {
    String creatorId = await _authRepository.getCurrentUserId();
    final message =
        await _messagesRepository.sendMessage(content, receiverId, creatorId);
    print(message.content);
  }
}
