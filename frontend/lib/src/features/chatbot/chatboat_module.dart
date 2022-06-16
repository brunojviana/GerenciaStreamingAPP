import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/chatbot/presentation/view/pages/chatbot_page.dart';

class ChatBotModule extends Module { 
  @override
  List<Bind<Object>> get binds => [

  ];

  @override
  List<ModularRoute> get routes => [
      ChildRoute('/', child: (_, __) => const ChatBot()),
  ];
}