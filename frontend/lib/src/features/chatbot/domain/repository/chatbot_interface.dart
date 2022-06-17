import 'package:frontend/src/features/chatbot/data/dto/chatbot_dto.dart';
import 'package:frontend/src/features/chatbot/domain/model/chatbot_model.dart';

abstract class IChatRepository{
  Future<ChatBotModel> message(ChatBotDto chatbot);
}
