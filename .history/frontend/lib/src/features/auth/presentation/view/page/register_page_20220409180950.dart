import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../viewmodel/register_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends ModularState<RegisterPage, RegisterViewModel> {
  late ThemeData _theme;

  Widget get _messenger_data => Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        height: 20,
        width: double.infinity,
        child: Text('data_hint'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.text, 
          ),
          textAlign: TextAlign.left,
        ),
      );
  
  Widget get _cpf => widget.createFormField(
        theme: _theme,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        hint: 'cpf_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.cpf,
        onChange: (value) => store.cpf = value,
      );

  Widget get _name => widget.createFormField(
        theme: _theme,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        hint: 'name_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.name,
        onChange: (value) => store.name = value,
      );

  Widget get _email => widget.createFormField(
        theme: _theme,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        hint: 'email_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.email,
        onChange: (value) => store.email = value,
      );

  Widget get _birthdate => widget.createFormField(
        theme: _theme,
        keyboardType: TextInputType.datetime,
        textInputAction: TextInputAction.next,
        hint: 'birthdate_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.birthdate,
        onChange: (value) => store.birthdate = value,
      );

  Widget get _messenger_password => Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        height: 20,
        width: double.infinity,
        child: Text('create_password'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.text, 
          ),
          textAlign: TextAlign.left,
        ),
      );

  Widget get _password => widget.createFormField(
        theme: _theme,
        keyboardType: TextInputType.text,
        obscureText: true,
        hint: 'create_password_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.password,
        onChange: (value) => store.password = value,
      );

  Widget get _validationPassword => Column(
    children: [Container(
        margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
        height: 18,
        width: double.infinity,
        child: Text('validation_lenght'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary, 
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
        height: 18,
        width: double.infinity,
        child: Text('validation_alphanumeric'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary, 
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
        height: 18,
        width: double.infinity,
        child: Text('validation_special_character'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary, 
          ),
          textAlign: TextAlign.center,
        ),
      )
    ],
  );

  Widget get _registerButton => Center(child: Container(
        margin: const EdgeInsets.fromLTRB(30, 15, 30, 5),
        width: 128,
        height: 41,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primaryLight),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          onPressed: store.isLoading ? null : store.register,
          child: Text('register_button'.i18n()),
        ),
      ),
  );

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('register_title'.i18n(), 
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
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 5),
                  _messenger_data,
                  _cpf,
                  _name,
                  _email,
                  _birthdate,
                  _messenger_password,
                  _password,
                  _validationPassword,
                  _registerButton,
                ],
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.primary,
        shape: const CircularNotchedRectangle(),
        child: Container(height: 47.0),
      ),
    );
  }
}