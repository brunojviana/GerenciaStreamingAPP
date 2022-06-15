import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../model/chat_model.dart';
import '../repository/chat_interface.dart';

class ChatBotUseCase{

  final repository = Modular.get<IChatRepository>();

}