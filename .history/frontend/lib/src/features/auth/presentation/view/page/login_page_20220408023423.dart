import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../../viewmodel/login_viewmodel.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends ModularState<LoginPage, LoginViewModel> {
  late ThemeData _theme;

  Widget get _images => Row(
        children: [Expanded(
          child: Image.asset('images/fones-de-ouvido.png',
            width: 46,
            height: 46,
            fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Image.asset('images/camera.png',
              width: 46,
              height: 46,
              fit: BoxFit.cover,
              ),
            ),
        ],
      );

  Widget get _messenger => Container(
        margin: const EdgeInsets.fromLTRB(30, 40, 30, 30),
        height: 35,
        width: double.infinity,
        child: Text('messenger'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.text, 
          ),
          textAlign: TextAlign.center,
        ),
      );

  Widget get _usermail => widget.createFormField(
        theme: _theme,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        hint: 'usermail_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.usermail,
        onChange: (value) => store.usermail = value,
      );

  Widget get _password => widget.createFormField(
        theme: _theme,
        keyboardType: TextInputType.text,
        obscureText: true,
        hint: 'password_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.password,
        onChange: (value) => store.password = value,
      );

  Widget get _forgotPasswordButton => Container(
        margin: const EdgeInsets.fromLTRB(30, 30, 30, 20),
        width: double.infinity,
        height: 35,
        child: TextButton(
          style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
          onPressed: store.isLoading ? null : () {},
          child: Text('forgot_password'.i18n()),
        ),
      );

  Widget get _loginButton => Center(child: Container(
        margin: const EdgeInsets.fromLTRB(30, 15, 30, 5),
        width: 128,
        height: 41,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          onPressed: store.isLoading ? null : store.login,
          child: Text('login'.i18n()),
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
          child: Text('register'.i18n()),
        ),
      );

  Widget get _bottomBar => Container(
        height: 47,
        width: double.infinity,
        color: AppColors.primary,
        alignment: Alignment.bottomCenter,
      );

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 113,
        backgroundColor: AppColors.primary,
        title: Column(
          children: const [Text('STREAMENT', 
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight, 
            ),
          ),
          Text('Gerencie suas assinaturas de serviço de streaming e acompanhe seu consumo',
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.center, 
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textLight,
            ),
          ),
          ],
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
                  _images,
                  _usermail,
                  _password,
                  _forgotPasswordButton,
                  _loginButton,
                  _register,
                  _bottomBar,
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}