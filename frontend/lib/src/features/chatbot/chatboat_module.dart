import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/chatbot/presentation/view/pages/chatbot_page.dart';
import '../chatbot/presentation/viewmodel/chatbot_viewmodel.dart';
import '../chatbot/domain/usecase/chatbot_usecase.dart';
import '../chatbot/domain/repository/chatbot_interface.dart';
import '../chatbot/data/repository/chatbot_repository.dart';

class ChatBotModule extends Module { 
  @override
  List<Bind<Object>> get binds => [
    Bind.factory((i) => ChatBotViewModel()),
    Bind.factory((i) => ChatBotUseCase()),
    Bind.factory<IChatRepository>((i) => ChatRepository()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => const ChatBotPage()),
  ];
}