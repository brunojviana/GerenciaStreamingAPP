import 'dart:convert';
import 'package:frontend/src/features/chatbot/data/dto/chatbot_dto.dart';
import 'package:frontend/src/features/chatbot/domain/repository/chatbot_interface.dart';
import 'package:frontend/src/features/chatbot/domain/model/chatbot_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ChatRepository implements IChatRepository{
  
  @override
  Future<ChatBotModel> message(ChatBotDto chatbot) async {   
    final dto = ChatBotDto.fromDomain(chatbot);
    final response = await Dio().post(
      'http://192.168.1.89:3000/message/text/send',
      data: dto.toJson(),
    );
    
    if (response.statusCode == 200) {
      final domain = ChatBotModel.fromJson(response.data) ;
      return domain;
    } else {
      throw Exception("Não conectou no Servidor!");
    }
  }  
}
  
  
  