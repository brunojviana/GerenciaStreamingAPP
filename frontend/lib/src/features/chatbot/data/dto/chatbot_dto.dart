import 'package:frontend/src/features/chatbot/domain/model/chat_model.dart';

class Message{
  final String text;
  final bool sent;

  const Message({
    required this.text,
    required this.sent,
  });

}

