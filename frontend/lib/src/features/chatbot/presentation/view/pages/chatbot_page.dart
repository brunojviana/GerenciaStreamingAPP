import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/features/auth/domain/model/profile.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:frontend/src/features/chatbot/data/dto/chatbot_dto.dart';
import 'package:intl/intl.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> { 
  List<Message> messages = [//Implementação para teste
    Message(
      text: 'Olá',
      sent: true,
    ),
    Message(
      text: 'Olá! O que você deseja saber sobre o Streament? Eu posso tirar suas dúvidas sobre: o que são serviços de streaming e as funcionalidades do aplicativo.',
      sent: false,
    ),
    Message(
      text: 'Funcionalidades',
      sent: true,
    ),
    Message(
      text: 'O Streament é um aplicativo desenvolvido para auxiliar você a gerenciar as suas assinaturas de serviços de streaming. Sobre qual funcionalidade deseja saber mais: Suas Assinaturas, Conteúdos, Histórico de Gastos ou Recomendações?',
      sent: false,
    ),
    Message(
      text: 'Suas Assinaturas',
      sent: true,
    ),
    Message(
      text: 'Essa funcionalidade te permite cadastrar, desativar ou excluir suas assinaturas de serviços de Streaming. É possível visualizar também a relação de suas assinaturas e informações relacionadas como provedor, preço, status e tempo de utilização.',
      sent: false,
    ),
    Message(
      text: 'preco',
      sent: true,
    ),
    Message(
      text: 'Lamento, mas não compreendi.',
      sent: false,
    ),
  ].reversed.toList(); 

  var now = DateTime.now();

  Widget get _date => Container(
    padding: EdgeInsets.only(top: 10, bottom: 10),
    child: Text(DateFormat.yMd('es').format(now),
    style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.accent 
      ),
    )
  );
  
  Widget get _listview_message=> Flexible(
    child: ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) => chat(
        messages[index].text.toString(),
        messages[index].sent)
    )  
  );
  
  Widget chat(String message, bool sent) => Container(  
    padding: EdgeInsets.only(left: 5, right: 5),
    child: Row(
      mainAxisAlignment: sent == true ? MainAxisAlignment.end : MainAxisAlignment.start,
      children:[
        sent == false ? Container(
          height: 40,
          width: 40,
          child: CircleAvatar(
            radius: 50, 
            backgroundImage: AssetImage('lib/assets/images/apple.png'),
          ),
        ): Container(),
         Padding(
            padding: EdgeInsets.all(15.0),
            child:Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                    child: Container(
                      constraints: BoxConstraints( maxWidth: 200),
                      child: Text(
                        message,
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text, 
                        ),
                    ),
                    )
                  ),
                ],
              ),
         ),

        sent == true? Container(
          height: 40,
          width: 40,
          child: CircleAvatar(
            radius: 50, 
            backgroundImage: AssetImage('lib/assets/images/perfil.png'),
          ),
        ) : Container(),
      ],  
    ),
  );

  Widget get _button_send => ElevatedButton(
    onPressed: () => null, //Add function
    child: Icon(Icons.send, color: AppColors.accent, ), 
    style: ElevatedButton.styleFrom(
      shape: CircleBorder(),
      padding: EdgeInsets.all(15),
      primary: Colors.white,
    ),
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


  late ThemeData _theme;
  late Profile _profile;

  @override
    Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('chat'.i18n(), 
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight, 
            ),
          ),
        ),

      body: SingleChildScrollView(
        child: Container(
          height: 700,
          child: Column(
            children: [
            _date,
            _listview_message,
            Divider(height: 1.0),
            _buildUserInput
            ],
          )
        ),
      ),
    );
  } 
}

      