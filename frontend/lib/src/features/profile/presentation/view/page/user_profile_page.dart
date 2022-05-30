import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../subscription/presentation/viewmodel/register_subscription_viewmodel.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends ModularState<UserProfilePage, RegisterSubscriptionViewModel> { //Alterar Notification
  
  late ThemeData _theme;

  String _textCpf = "000.000.000-0";
  String _textName ="Cristiano Ronaldo";
  String _textbirthdate = "DD/MM/AAAA";
  String _textEmail = "cristiano@gmail.com";

  
  Widget get _message_photo => Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
    width: double.infinity,
    child: Text('photo'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _photo => Container( //Imagem usuario
  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 128.0,
    width: 128.0,
      child: CircleAvatar( 
        radius: 55,
        backgroundColor: AppColors.accent,
        child: CircleAvatar(
          radius: 50, 
          backgroundImage: AssetImage('lib/assets/images/perfil.png'), 
        ),
      ),
  );


  Widget get _message_cpf => Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    width: double.infinity,
    child: Text('cpf'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _cpf => Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    width: double.infinity,
    child: Text('cpf'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _cpf_field => Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 112, 194, 184), //Add AppColor
      borderRadius: BorderRadius.circular(5),
    ),
    child: Text(_textCpf,
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 14,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

   Widget get _message_name => Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    width: double.infinity,
    child: Text('name'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _name_field => Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 112, 194, 184),
      borderRadius: BorderRadius.circular(5),
    ),
    
    child: Text(_textName,
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 14,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _message_data => Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    width: double.infinity,
    child: Text('birthdate'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _data_field => Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 112, 194, 184),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Text(_textbirthdate,
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 14,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );


  Widget get _message_email => Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    width: double.infinity,
    child: Text('e-mail'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _usermail => Container(
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.accent,
      borderRadius: BorderRadius.circular(5),
    ),
    child: widget.createFormField(
      theme: _theme,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      hint: _textEmail,
    ),
  );

  Widget get _button_change_password => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: Column(
      children: [
        IconButton( 
          icon: Image.asset('lib/assets/images/senha.png'),
          iconSize: 35.0,
          onPressed: (){
          },
        ),
        Text('change_password'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
          ),
          textAlign: TextAlign.center
        ),
      ]
    )
  );

   @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

  return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('my_informations'.i18n(),  
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textLight, 
          ),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Observer(builder: (_) {
            return Form(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    _message_photo,
                    _photo,
                    _message_cpf,
                    _cpf_field,
                    _message_name,
                    _name_field,
                    _message_data,
                    _data_field,
                    _message_email,
                    _usermail,
                    _button_change_password
                  ],
                ),
              ),
            );
          })
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: AppColors.primary,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 47.0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Positioned(
              bottom: 20,
              child: IconButton(
                icon: const Icon(Icons.home, color: AppColors.textLight),
                onPressed: () {
                  Modular.to.pushNamed('/home');
                }
              ),  
            )
          ),
        ),
      ),

  );
  }
}