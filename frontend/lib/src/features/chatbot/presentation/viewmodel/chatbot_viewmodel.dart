import 'dart:convert';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/model/chatbot_model.dart';
import '../../domain/model/chatbot_message.dart';
import '../../domain/usecase/chatbot_usecase.dart';
import 'package:localization/localization.dart';

part 'chatbot_viewmodel.g.dart';

class ChatBotViewModel = _ChatBotViewModelBase with _$ChatBotViewModel;

abstract class _ChatBotViewModelBase with Store {
  
  final error = ChatBotError();
  final _usecase = Modular.get<ChatBotUseCase>();
  final chatBotList = ChatBotList();
    
  @observable 
  String text = '';

  @observable
  bool isLoading = false;

  @action
  void validateText() {
    error.text = _usecase.validateText(text);
  }

  void message() async {
    
    error.clear();
    validateText();

    String name = "";
    String message = "";

    if (!error.hasErrors) {
      
      name = 'chatbot_name'.i18n();
      chatBotList.addMessage(name, text, ChatMessageType.sent);

      isLoading = true;
     
      String email = "teste@gmail.com";//teste
      String sessionId = "sessao07";//teste

      name = "Streament";
  
      try { 
        final response = await _usecase.message(text, email, sessionId);
        message = response.fulfillmentText.toString();              
      } 
      on Exception {
        message = 'chatbot_error'.i18n();
      }
        chatBotList.addMessage(name, message, ChatMessageType.received);
        isLoading = false;
    }
  }
}

class ChatBotError = _ChatBotErrorBase with _$ChatBotError;

abstract class _ChatBotErrorBase with Store {
  @observable
  String? text;

  @observable
  String? message;
  
  @computed
  bool get hasErrors => text != null || message != null;

  void clear() {
    text = null;
    message = null;
  }
}

class ChatBotList = _ChatBotListBase with _$ChatBotList;

abstract class _ChatBotListBase with Store{

  @observable
  List<ChatMessage> messageList = [];

  @action
  void addMessage(String name, String text, ChatMessageType type){
    var message = ChatMessage(text, name, type); 
    messageList = List.from(messageList..insert(0, message));
  }
  
}

