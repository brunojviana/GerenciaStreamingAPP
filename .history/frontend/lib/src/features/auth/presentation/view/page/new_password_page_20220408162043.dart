import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../../viewmodel/new_password_viewmodel.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({ Key? key }) : super(key: key);

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}
class _NewPasswordPageState extends ModularState<NewPasswordPage, NewPasswordViewModel> {
  late ThemeData _theme;

  Widget get _messengerCode => Container(
        margin: const EdgeInsets.fromLTRB(30, 40, 30, 30),
        height: 35,
        width: double.infinity,
        child: Text('messenger_code'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.text, 
          ),
          textAlign: TextAlign.center,
        ),
      );

  Widget get _code => widget.createFormField(
        theme: _theme,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        hint: 'code_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.code,
        onChange: (value) => store.code = value,
      );


  Widget get _messengerNewPassword => Container(
        margin: const EdgeInsets.fromLTRB(30, 40, 30, 30),
        height: 35,
        width: double.infinity,
        child: Text('messenger_new_password'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.text, 
          ),
          textAlign: TextAlign.center,
        ),
      );

  Widget get _newpassword => widget.createFormField(
        theme: _theme,
        keyboardType: TextInputType.text,
        obscureText: true,
        hint: 'newPassword_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.newPassword,
        onChange: (value) => store.newPassword = value,
      );

  Widget get _confirmedNewpassword => widget.createFormField(
        theme: _theme,
        keyboardType: TextInputType.text,
        obscureText: true,
        hint: 'newPassword_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.confirmedNewPassword,
        onChange: (value) => store.confirmedNewPassword = value,
      );

  Widget get _validationPassword => Column(
    children: [Container(
        margin: const EdgeInsets.fromLTRB(30, 40, 30, 30),
        height: 20,
        width: double.infinity,
        child: Text('validation_lenght'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary, 
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(30, 40, 30, 30),
        height: 20,
        width: double.infinity,
        child: Text('validation_alphanumeric'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary, 
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(30, 40, 30, 30),
        height: 20,
        width: double.infinity,
        child: Text('validation_special_character'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary, 
          ),
          textAlign: TextAlign.center,
        ),
      )
    ],
  );

  Widget get _setNewPasswordButton => Center(child: Container(
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
          onPressed: store.isLoading ? null : store.setNewPassword,
          child: Text('setNewPassowrd'.i18n()),
        ),
      ),
  );

  Widget get _register => Container(
        margin: const EdgeInsets.fromLTRB(30, 40, 30, 30),
        height: 35,
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          onPressed: store.isLoading
              ? null
              : () {
                  Navigator.pop(context);
                  Modular.to.pushNamed('/register');
                },
          child: Text('register'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.secondary, 
            ),
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
        title: Text('set_new_password'.i18n(), 
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
                  _messenger,
                  //_images,
                  _usermail,
                  _password,
                  _forgotPasswordButton,
                  _loginButton,
                  _register,
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