import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:property_management/models/message.dart';
import 'package:property_management/repositories/messages_repository.dart';
import 'dart:async';

class MessagesFireStore extends MessagesRepository {
  final _fireStore = Firestore.instance;
  static const COLLECTION_KEY = "messages";

  @override
  Future<List<Message>> getMessages(String userId) async {
    final querySnapshots =
        await _fireStore.collection(COLLECTION_KEY).snapshots().toList();
    if (querySnapshots != null && querySnapshots.length > 0) {
      final messages = _messagesFromSnapshot(querySnapshots.first);
      return messages;
    }
    return [];
  }

  @override
  Stream<List<Message>> getStreamMessages() {
    final streamQuerySnapshots = _fireStore
        .collection(COLLECTION_KEY)
        .orderBy('created_date', descending: false)
        .snapshots();
    return streamQuerySnapshots
        .asyncMap((querySnapshot) => _messagesFromSnapshot(querySnapshot));
  }

  @override
  Future<Message> sendMessage(Message message) async {
    final document =
        await _fireStore.collection(COLLECTION_KEY).add(message.toJson());
    if (document != null) {
      return Message(
          id: document.documentID,
          content: message.content,
          creatorId: message.creatorId,
          receiverId: message.receiverId,
          createdDate: message.createdDate);
    }
    return null;
  }

  List<Message> _messagesFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((document) {
      return Message.fromJson(document.data);
    }).toList();
  }
}
