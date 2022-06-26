import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/features/auth/domain/model/profile.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:frontend/src/features/chatbot/data/dto/chatbot_dto.dart';
import '../../../domain/model/chatbot_model.dart';
import 'package:intl/intl.dart';
import '../../viewmodel/chatbot_viewmodel.dart';
import '../../../../auth/presentation/viewmodel/login_viewmodel.dart';
import '../../../../auth/presentation/viewmodel/new_password_viewmodel.dart';
import '../../../domain/model/chatbot_message.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({Key? key}) : super(key: key);

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends ModularState<ChatBotPage, ChatBotViewModel>{ 
   
  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
  _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('chatbot'.i18n(), 
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textLight, 
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
          Flexible(    
            child: Observer( 
              builder:(_) => ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemCount: store.chatBotList.messageList.length,
                itemBuilder: (_, int index) => ChatMessageListItem(chatMessage: store.chatBotList.messageList[index]),
              ),
            ),
          ),
          Divider(height: 1.0),
          _buildUserInput
          ],
        ),
      )
    );
  }


  Widget get _button_send => ElevatedButton(
    child: Icon(Icons.send, color: AppColors.accent, ), 
    style: ElevatedButton.styleFrom(
      shape: CircleBorder(),
      padding: EdgeInsets.all(15),
      primary: Colors.white,
    ),
    onPressed: store.isLoading ? null : store.message,
  );

  Widget get _message_chat => Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
    height: 60,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.accent,
      borderRadius: BorderRadius.circular(5),
    ),
    child: widget.createFormField(
      theme: _theme,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      hint: 'chatbot_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.text,
      onChange: (value) => store.text = value,
    )
  );
  
  Widget get _buildUserInput => Row(
    children: [
      Flexible(
        child: (
          _message_chat
        ),
      ),
      _button_send,
    ],
  );
}

class ChatMessageListItem extends StatelessWidget {  
  final ChatMessage chatMessage;
  
  ChatMessageListItem({required this.chatMessage});

  @override
  Widget build(BuildContext context) {
    return chatMessage.type == ChatMessageType.sent
        ? _showSentMessage: _showReceivedMessage;
  }

  Widget get _showSentMessage => ListTile(
    contentPadding: EdgeInsets.fromLTRB(64.0, 0.0, 8.0, 0.0),
    trailing: CircleAvatar(child: Text(chatMessage.text.toUpperCase()[0])),
    title: Text(chatMessage.name,  textAlign: TextAlign.right,
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
    ),
    subtitle: Text(chatMessage.text, textAlign: TextAlign.right,
      style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 10,
          color: AppColors.text, 
        ),
    ),
  );
  

  Widget get _showReceivedMessage => ListTile(
    contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 64.0, 0.0),
    leading: CircleAvatar(
      radius: 20, 
      backgroundImage: AssetImage('lib/assets/images/perfil.png'),
    ),
    title: Text(chatMessage.name, textAlign: TextAlign.left,
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
        ),
      ),
    subtitle: Text(chatMessage.text, textAlign: TextAlign.left,
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 10,
        color: AppColors.text, 
      ),
    ),
  );
}     