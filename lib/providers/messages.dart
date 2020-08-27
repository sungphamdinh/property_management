import 'package:flutter/foundation.dart';
import 'package:property_management/data/auth_firebase.dart';
import 'package:property_management/data/messages_firestore.dart';
import 'package:property_management/locator.dart';
import 'package:property_management/models/message.dart';

class Messages with ChangeNotifier {
  final _messagesRepository = getIt.get<MessagesFireStore>();
  final _authRepository = getIt.get<AuthFireBase>();

  List<Message> _messages = [];
  List<Message> get messages => [..._messages];

  Future<void> sendMessage(String content, String receiverId) async {
    String creatorId = await _authRepository.getCurrentUserId();
    final message = await _messagesRepository.sendMessage(Message(
        id: "",
        content: content,
        creatorId: creatorId,
        receiverId: receiverId,
        createdDate: DateTime.now().millisecondsSinceEpoch));
    _messages.add(message);
  }

  Stream<List<Message>> getMessages() {
    return _messagesRepository.getStreamMessages();
  }
}
