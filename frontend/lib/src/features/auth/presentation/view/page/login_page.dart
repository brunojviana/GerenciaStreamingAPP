import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/features/auth/domain/model/profile.dart';
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
  late Profile? _profile;
  late Profile? _response;

  Widget get _images => Center(
    child: Container(
      margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
      height: 80,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image.asset('lib/assets/images/fones-de-ouvido.png',
              width: 80,
              height: 80,
              fit: BoxFit.contain,
              ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            height: 80,
            width: 80,
            child: Image.asset('lib/assets/images/camera.png',
              width: 80,
              height: 80,
              fit: BoxFit.contain,
              ),
            ),
          ],
        )
      ),
  );
  
  Widget get _messenger => Container(
    margin: const EdgeInsets.fromLTRB(30, 40, 30, 30),
    height: 20,
    width: double.infinity,
    child: Text('messenger'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.center,
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

  Widget get _password => Container(
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
      hint: 'password_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.password,
      onChange: (value) => store.password = value,
    ),
  );

  Widget get _forgotPasswordButton => Container(
    margin: const EdgeInsets.fromLTRB(30, 30, 30, 5),
    width: double.infinity,
    height: 35,
    child: TextButton(
      style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
        onPressed: store.isLoading ? null : () {
          Modular.to.pushNamed('reset');
        },
        child: Text('forgot_password'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.secondary, 
          ),
        ),
      ),
    );

  Widget get _loginButton => Center(
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
        onPressed: () async {
          _profile = await _login();
          print(_profile?.toJson());
          if (_profile == null) {
            _showDialog(_profile);
          }
          else
          {
            store.saveUser(_profile!);
            Modular.to.pushNamed('home', arguments: _profile);
          }
        },
        child: Text('login'.i18n()),
      ),
    ),
  );

  Widget get _register => Container(
    margin: const EdgeInsets.fromLTRB(30, 15, 30, 30),
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
      onPressed: () async {
        store.isLoading ? null : 
        Modular.to.pushNamed('register');
      },
      child: Text('register_link'.i18n(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.secondary, 
        ),
      ),
    ),
  );

  Future<Profile?> _login() async {
    Profile? _response = await store.login();
    return _response;
  }  

  Future<void> _showDialog(Profile? _profile) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(Icons.error, size: 40, color: Colors.red),
          content: Text('login_error'.i18n(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[TextButton(
            child: Text('ok'.i18n().toString()),
            onPressed: () {
              Navigator.pop(context);
            },  
          )],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 113,
        backgroundColor: AppColors.primary,
        title: Column(
          children: [
            const Text('STREAMENT', 
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textLight, 
              ),
            ),
            Text('intro'.i18n(),
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.center, 
              style: const TextStyle(
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
          padding: const EdgeInsets.all(10.0),
          child: Observer(builder: (_) {
            return Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 5),
                  _images,
                  _messenger,
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
        child: Container(height: 45.0, color: AppColors.primary),
      ),
    );
  }
}