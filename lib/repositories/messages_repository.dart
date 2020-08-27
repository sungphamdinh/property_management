import 'package:property_management/models/message.dart';

abstract class MessagesRepository {
  Future<List<Message>> getMessages(String userId);
  Stream<List<Message>> getStreamMessages();
  Future<void> sendMessage(Message message);
}
