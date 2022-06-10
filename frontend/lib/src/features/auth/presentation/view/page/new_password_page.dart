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

  Widget get _image => Center(
    child: Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
      height: 80,
      width: double.infinity,
      child: SizedBox(
        height: 80,
        width: 80,
        child: Image.asset('lib/assets/images/senha.png',
          width: 80,
          height: 80,
          fit: BoxFit.contain,
        ),
      )
    ),
  );

  Widget get _messengerCode => Container(
        margin: const EdgeInsets.fromLTRB(15, 40, 20, 10),
        height: 20,
        width: double.infinity,
        child: Text('messenger_code'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
          ),
          textAlign: TextAlign.left,
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
        margin: const EdgeInsets.fromLTRB(15, 20, 30, 10),
        height: 20,
        width: double.infinity,
        child: Text('messenger_new_password'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
          ),
          textAlign: TextAlign.left,
        ),
      );

  Widget get _newPassword => widget.createFormField(
        theme: _theme,
        keyboardType: TextInputType.text,
        obscureText: true,
        hint: 'create_password_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.newPassword,
        onChange: (value) => store.newPassword = value,
      );

  Widget get _confirmedNewpassword => widget.createFormField(
        theme: _theme,
        keyboardType: TextInputType.text,
        obscureText: true,
        hint: 'confirmPassword_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.confirmedNewPassword,
        onChange: (value) => store.confirmedNewPassword = value,
      );

  Widget get _validationPassword => Column(
    children: [Container(
        margin: const EdgeInsets.fromLTRB(4.5, 4.5, 4.5, 4.5),
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
        margin: const EdgeInsets.fromLTRB(4.5, 4.5, 4.5, 4.5),
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
        margin: const EdgeInsets.fromLTRB(4.5, 4.5, 4.5, 4.5),
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

  Widget get _setNewPasswordButton => Center(
    child: SizedBox(
      height: 100,
      child: Center(
        child: Container(
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
            child: Text('send'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.textLight, 
              ),
            ),
          ),
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
        centerTitle: true,
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
                  _image,
                  _messengerCode,
                  _code,
                  _messengerNewPassword,
                  _newPassword,
                  _confirmedNewpassword,
                  _validationPassword,
                  _setNewPasswordButton,
                ],
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.primary,
        shape: const CircularNotchedRectangle(),
        child: Container(height: 45.0, color: AppColors.primary),
      ),
    );
  }
}