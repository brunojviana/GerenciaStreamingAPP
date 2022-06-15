import 'package:frontend/src/features/chatbot/domain/model/chat_model.dart';

abstract class IChatRepository{
  Future<ChatBotModel> fulfillmentText(String texto);
}
