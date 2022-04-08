import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../../viewmodel/login_viewmodel.dart';

/*class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends ModularState<LoginPage, LoginViewModel> {

  void _entrar(){ 

  }

  void _esqueciSenha(){

  }

  void _cadastro(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: Column(
          children: <Widget>[
            Text('Meu Streaming', 
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 90, 81, 81), 
              ),
            ),
            SizedBox(height: 5),
            Text('Gerencie suas assinaturas de serviço de Streaming e acompanhe seu consumo ',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textLight, 
              ),
            ),
          ],
        ),
      ),

      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              Text('Insira seu Usuário e Senha',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondary, 
                ),
              ),
              
              SizedBox(height: 40),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 25),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
                ), 
              ),
              
              Container( 
                height: 40,
                alignment: Alignment.center,
                child: TextButton(
                  child: Text(
                    'Esqueci minha Senha',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondary, 
                      ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: _esqueciSenha,
                ),
              ),

              SizedBox(height: 40),

              ElevatedButton(
                onPressed: _entrar,
                child: Text(
                  'ENTRAR',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textLight, 
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 18,
                  ),
                ),
              ),

              SizedBox(height: 40),

              Container( 
                height: 48,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    TextButton(
                      child: Text(
                      'Não possui conta? Cadastre-se',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textLight, 
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: _cadastro,
                    ),
                  ],
                ),
              ),
            ], 
          ),
        ),
      ),      
    );
  }
}*/

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginViewModel> {
  late ColorScheme _colors;
  late ThemeData _theme;

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

  Widget get _loginButton => Container(
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
      );

  Widget get _forgotPasswordButton => Container(
        margin: const EdgeInsets.fromLTRB(30, 30, 30, 20),
        width: double.infinity,
        height: 56,
        child: TextButton(
          style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
          onPressed: store.isLoading ? null : () {},
          child: Text('forgot_password'.i18n()),
        ),
      );

  Widget get _signUp => Container(
        margin: const EdgeInsets.fromLTRB(30, 40, 30, 30),
        height: 56,
        width: double.infinity,
        child: OutlinedButton(
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
                  Modular.to.pushNamed('/signup/');
                },
          child: Text('signup'.i18n()),
        ),
      );

  Widget get _divider => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(
              child: Divider(thickness: 1, indent: 25, endIndent: 10)),
          Text(
            'divider_text'.i18n(),
            style: _theme.textTheme.headline6,
          ),
          const Expanded(
            child: Divider(
              thickness: 1,
              indent: 10,
              endIndent: 25,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _colors = _theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
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
                  _usermail,
                  _password,
                  _loginButton,
                  _forgotPasswordButton,
                  _divider,
                  _signUp
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}