import 'package:property_management/models/message.dart';

abstract class MessagesRepository {
  Stream<List<Message>> getMessages(String userId);
  Future<void> sendMessage(String content, String receiverId, String creatorId);
}
