import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../domain/model/profile.dart';
import '../../viewmodel/register_viewmodel.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends ModularState<RegisterPage, RegisterViewModel> {
  late ThemeData _theme;
  XFile? _photo;
  late int? _response;
  late Profile _profile;
  
  Widget get _messagePhoto => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 20,
    width: double.infinity,
    child: Text('photo_hint'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.center,
    ),
  );

  Widget get _imageProfile =>  Center(
    child: Stack(
	    children: [
	      CircleAvatar(
	        radius: 50.0,
          backgroundColor: Colors.grey,
	        backgroundImage: _photo != null ? FileImage(File(_photo!.path)) : null,
          foregroundImage: _photo == null ? const AssetImage('lib/assets/images/perfil.png') : null,
	      ),
	      Positioned(
	        bottom: 5.0,
	        right: 5.0,
	        child: InkWell(
            onTap: () {
	            showModalBottomSheet(context: context, builder: ((builder) => _bottomSheet),
	            );
            },
            child: const Icon(
	            Icons.add_a_photo,
	            color: AppColors.primary,
	            size: 28.0,
	          ),
	        ),
	      ),
	    ]
    ),
	);

  Widget get _bottomSheet => Container(
	  height: 100.0,
	  width: MediaQuery.of(context).size.width,
	  margin: const EdgeInsets.symmetric(
	    horizontal: 20,
	    vertical: 20,
	  ),
	  child: Center(
	    child: Column(
	      children: [
	        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
	            SizedBox(
                height: 100,
                width: 100,
	              child: Column(
	                children: [
	                  IconButton(
                      iconSize: 60, 
	                    icon: const Icon(Icons.camera_alt),
	                    onPressed: () {
	                      _selectPhoto(ImageSource.camera);
                      },
	                  ),
                    Text('camera'.i18n()),
	                ],
	              ),
	            ),
              SizedBox(
                height: 100,
                width: 100,
	              child: Column(
	                children: [
	                  IconButton(
                      iconSize: 60, 
	                    icon: const Icon(Icons.image),
	                    onPressed: () {
	                      _selectPhoto(ImageSource.gallery);
                      },
	                  ),
                    Text('gallery'.i18n()),
	                ],
	              ),
	            ),
	          ]
          ),
	      ]
      ),
	  ),
	);

  Widget get _messageData => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 18,
    width: double.infinity,
    child: Text('data_hint'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );
  
  Widget get _cpf => Container(
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
      hint: 'cpf_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.cpf,
      onChange: (value) => store.cpf = value,
    ),
  );

  Widget get _name => Container(
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
      hint: 'name_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.name,
      onChange: (value) => store.name = value,
    ),
  );

  Widget get _email => Container(
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
      hint: 'email_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.email,
      onChange: (value) => store.email = value,
    ),
  );

  Widget get _dateBirth => Container(
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
      hint: 'birthdate_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.dateBirth,
      onChange: (value) => store.dateBirth = value,
    ),
  );

  Widget get _messagePassword => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 18,
    width: double.infinity,
    child: Text('create_password'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
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
      hint: 'create_password_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.password,
      onChange: (value) => store.password = value,
    ),
  );

  Widget get _confirmePassword => Container(
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
      errorText: store.error.confirmedPassword,
      onChange: (value) => store.confirmedPassword = value,
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
          color: AppColors.secondary, 
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
          color: AppColors.secondary, 
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
          color: AppColors.secondary, 
        ),
        textAlign: TextAlign.center,
      ),
    )],
  );

  Widget get _registerButton => Center(
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
          _response = await _register(_photo);
          _profile = await store.getSavedUser();
          _showDialog(_profile);
        },
        child: Text('register_button'.i18n()),
      ),
    )
  );

  void _selectPhoto(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
	
    try{
      XFile? file = await picker.pickImage(source: source);
      if (file != null) {
        setState(() => _photo = file);
      } 
    } catch (e) {
      _photo = null;
    }
  }

  Future<int?> _register(XFile? photo) async {
    print('aqui');
    int? _response = await store.register(photo?.path);
    return _response;
  }  

  Future<void> _showDialog(Profile? profile) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: (profile != null) ? 
            const Icon(Icons.done, size: 40, color: Colors.green) :
            const Icon(Icons.error, size: 40, color: Colors.red),
          content: (profile != null) ?
            Text('register_success'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.text, 
              ),
              textAlign: TextAlign.center,
            ) :
            Text('register_error'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          actions: (profile != null) ?           
          <Widget>[TextButton(
            child: Text('ok'.i18n().toString()),
              onPressed: () { 
                Navigator.pop(context);
                Modular.to.pushNamed('/auth', arguments: profile);
              },  
            ),
          ] :          
          <Widget>[ TextButton(
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
        title: Text('register_title'.i18n(), 
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
          padding: const EdgeInsets.all(15.0),
          child: Observer(builder: (_) {
            return Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _messagePhoto,
                  _imageProfile,
                  _messageData,
                  _cpf,
                  _name,
                  _email,
                  _dateBirth,
                  _messagePassword,
                  _password,
                  _confirmePassword,
                  _validationPassword,
                  const SizedBox(height: 5),
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
        child: Container(height: 45.0, color: AppColors.primary),
      ),
    );
  }
}