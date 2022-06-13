import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../viewmodel/reset_password_viewmodel.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({ Key? key }) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ModularState<ResetPasswordPage, ResetPasswordViewModel> {
  late ThemeData _theme;

  Widget get _image => Center(
    child: Container(
      margin: const EdgeInsets.fromLTRB(140, 0, 140, 0),
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

  Widget get _messenger => Container(
        margin: const EdgeInsets.fromLTRB(15, 40, 30, 10),
        height: 20,
        width: double.infinity,
        child: Text('email_hint'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
          ),
          textAlign: TextAlign.left,
        ),
      );

  Widget get _usermail => Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
    height: 70,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.accent,
      borderRadius: BorderRadius.circular(5),
    ),
    child: widget.createFormField(
      theme: _theme,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      hint: 'usermail_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.usermail,
      onChange: (value) => store.usermail = value,
    ),
  );

  Widget get _resetPasswordButton => Center(
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
            onPressed: store.isLoading ? null : () {
                    Modular.to.pushNamed('newpassword');
                  },
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
        title: Text('reset_password'.i18n(), 
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight, 
            ),
            textAlign: TextAlign.center,
          ),
        centerTitle: true,
        ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Observer(builder: (_) {
            return Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 5),
                  _image,
                  _messenger,
                  _usermail,
                  _resetPasswordButton
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