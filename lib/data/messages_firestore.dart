import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:property_management/models/message.dart';
import 'package:property_management/repositories/messages_repository.dart';

class MessagesFireStore extends MessagesRepository {
  final _fireStore = Firestore.instance;
  static const COLLECTION_KEY = "messages";

  @override
  Stream<List<Message>> getMessages(String userId) {}

  @override
  Future<Message> sendMessage(
      String content, String receiverId, String creatorId) async {
    final document = await _fireStore.collection(COLLECTION_KEY).add({
      'content': content,
      'creator_id': creatorId,
      'receiver_id': receiverId,
      'created_date': DateTime.now().toIso8601String()
    });

    if (document != null) {
      return Message(
          id: document.documentID,
          content: content,
          creatorId: creatorId,
          receiverId: receiverId);
    }
    return null;
  }
}
