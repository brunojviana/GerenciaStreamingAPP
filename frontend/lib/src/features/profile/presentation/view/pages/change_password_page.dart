import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../viewmodel/change_password_viewmodel.dart';

class ChangePasswordPage extends StatefulWidget {
  final Profile profile;
  const ChangePasswordPage({ Key? key, required this.profile}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}
class _ChangePasswordPageState extends ModularState<ChangePasswordPage, ChangePasswordViewModel> {
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

  Widget get _messageCreatePassword => Container(
    margin: const EdgeInsets.fromLTRB(15, 40, 20, 10),
    height: 20,
    width: double.infinity,
    child: Text('create_password'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _currentPassword => Container(
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
      hint: 'current_password_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.currentPassword,
      onChange: (value) => store.currentPassword = value,
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
              int? res = await store.setNewPassword(widget.profile.password!);
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
                  _messageCreatePassword,
                  _currentPassword,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 45.0,
              child: IconButton(
                icon: const Icon(Icons.home, color: AppColors.textLight),
                iconSize: 35,
                onPressed: () {
                  Modular.to.pushNamed('/home', arguments: widget.profile);
                }
              ),
            ),
            SizedBox(
              height: 45.0,
              child: IconButton(
                icon: const Icon(Icons.logout, color: AppColors.textLight),
                iconSize: 35,
                onPressed: () {
                  Modular.to.pushNamed('/auth');
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}