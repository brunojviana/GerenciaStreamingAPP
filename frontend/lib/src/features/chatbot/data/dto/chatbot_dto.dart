import 'package:frontend/src/features/chatbot/domain/model/chatbot_model.dart';
class ChatBotDto{
  const ChatBotDto(this.text,this.email,this.sessionId);

  final String text;
  final String? email;
  final String? sessionId;

 factory ChatBotDto.fromDomain(ChatBotDto chatbot) {
    return ChatBotDto(chatbot.text, chatbot.email, chatbot.sessionId);
  }

  factory ChatBotDto.fromJson(Map<String, dynamic> json) =>
      ChatBotDto(json['text'], json['email'], json['sessionId']);

  Map<String, dynamic> toJson() => {'text': text, 'email': email, 'sessionId': sessionId}; 
}
