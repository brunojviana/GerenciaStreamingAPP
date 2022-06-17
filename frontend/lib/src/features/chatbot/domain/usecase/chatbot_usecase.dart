import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../model/chatbot_model.dart';
import '../repository/chatbot_interface.dart';
import '../../data/dto/chatbot_dto.dart';

class ChatBotUseCase{
  final repository = Modular.get<IChatRepository>();

  String? validateText(String text) {
    if (text.isEmpty) {
      return 'usermail_required'.i18n();
    }
    return null;
  }

   Future<ChatBotModel> message(String text, String email, String sessionId){
    return repository.message(ChatBotDto(text, email, sessionId));
  }
}