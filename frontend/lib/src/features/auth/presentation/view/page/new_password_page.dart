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
  late int? _response;
  
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

  Widget get _code => Container(
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
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      hint: 'code_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.code,
      onChange: (value) => store.code = value,
    ),
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

  Widget get _newPassword => Container(
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
      hint: 'create_password_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.newPassword,
      onChange: (value) => store.newPassword = value,
    ),
  );

  Widget get _confirmedNewpassword => Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.fromLTRB(10, 3, 10, 20),
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
      hint: 'confirm_password_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.confirmedNewPassword,
      onChange: (value) => store.confirmedNewPassword = value,
    ),
  );

  Widget get _validationPassword => Column(
    children: [
      SizedBox(
        height: 18,
        width: double.infinity,
        child: Text('validation_lenght'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.text, 
          ),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: 18,
        width: double.infinity,
        child: Text('validation_alphanumeric'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.text, 
          ),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: 18,
        width: double.infinity,
        child: Text('validation_special_character'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.text, 
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
            onPressed: () async {
              _response = await _setNewPassword();
              _showDialog(_response);
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

  Future<int?> _setNewPassword() async {
    int? _response = await store.setNewPassword();
    return _response;
  }  

  Future<void> _showDialog(int? response) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: (response != null) ? 
            const Icon(Icons.done, size: 40, color: Colors.green) :
            const Icon(Icons.error, size: 40, color: Colors.red),
          content: (response != null) ?
            Text('change_password_success'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.text, 
              ),
              textAlign: TextAlign.center,
            ) :
            Text('change_password_error'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          actions: (response != null) ?           
          <Widget>[TextButton(
            child: Text('ok'.i18n().toString()),
              onPressed: () { 
                Navigator.pop(context);
                Modular.to.pushNamed('/auth');
              },  
            ),
          ] :          
          <Widget>[TextButton(
              child: Text('cancel'.i18n().toString()),
              onPressed: () async {
                Navigator.pop(context);
                Modular.to.pushNamed('/auth');
              },  
            ),
            TextButton(
              child: Text('ok'.i18n().toString()),
              onPressed: () {
                Navigator.pop(context);
              },  
            )
          ],
        );
      }
    );
  }

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
        child: 
          Container(
            alignment: Alignment.center,
            height: 45.0,
            child: IconButton(
              icon: const Icon(Icons.logout, color: AppColors.textLight),
              iconSize: 35,
              onPressed: () {
                Modular.to.pushNamed('/auth');
              }
            ),
          ),
        ),
    );
  }
}