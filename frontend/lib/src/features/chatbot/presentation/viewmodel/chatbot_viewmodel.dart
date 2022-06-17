import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/model/chatbot_model.dart';
import '../../domain/model/chatbot_message.dart';
import '../../domain/usecase/chatbot_usecase.dart';

part 'chatbot_viewmodel.g.dart';

class ChatBotViewModel = _ChatBotViewModelBase with _$ChatBotViewModel;

abstract class _ChatBotViewModelBase with Store {
  
  final error = ChatBotError();
  final _usecase = Modular.get<ChatBotUseCase>();
    
  @observable 
  String text = '';

  @observable
  bool isLoading = false;

  @observable
  ObservableList<ChatMessage> messageList = <ChatMessage>[].asObservable();

  @action
  void validateText() {
    error.text = _usecase.validateText(text);
  }

  @action 
  void addMessage(ChatMessage messageChat) {
    messageList..insert(0,messageChat);
    print(messageList);
    print(text);
  }
   
  void message() async {
    
    error.clear();
    validateText();

    if (!error.hasErrors) {
      
      String name = "Usuário";//teste
      ChatMessageType type = ChatMessageType.sent;
      var messageObj = ChatMessage(text, name, type);
      addMessage(messageObj);

      isLoading = true;
      String email = "teste@gmail.com";//teste
      String sessionId = "sessao07";//teste

      try {
        final response = await _usecase.message(text, email, sessionId);
        String test = response.fulfillmentText.toString();
        print('O valor de FulfillmentText: $test');

      } on UnimplementedError {
       
      } finally {
        isLoading = false;
      }
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

