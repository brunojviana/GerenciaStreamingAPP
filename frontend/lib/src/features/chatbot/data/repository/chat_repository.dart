import 'dart:convert';
import 'package:frontend/src/features/chatbot/domain/repository/chat_interface.dart';
import 'package:frontend/src/features/chatbot/domain/model/chat_model.dart';
import 'package:http/http.dart' as http;

class ChatRepository implements IChatRepository{
  
  @override
  Future<ChatBotModel> fulfillmentText(String texto) {  
    throw UnimplementedError();
  }
  
}