import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
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

  Widget get _messagePhoto => Container(
        margin: const EdgeInsets.fromLTRB(10, 20, 20, 10),
        height: 20,
        width: double.infinity,
        child: Text('photo_hint'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
          ),
          textAlign: TextAlign.left,
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
			]),
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
		  		]),
		  	]),
		  ),
	  );

  Widget get _messageData => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 20,
    width: double.infinity,
    child: Text('data_hint'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
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

  Widget get _dateBirth => widget.createFormField(
    theme: _theme,
    keyboardType: TextInputType.datetime,
    textInputAction: TextInputAction.next,
    hint: 'birthdate_hint'.i18n(),
    enabled: !store.isLoading,
    errorText: store.error.dateBirth,
    onChange: (value) => store.dateBirth = value,
  );

  Widget get _messagePassword => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
    )],
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
      onPressed: () {
        store.isLoading ? null : _register(_photo);
      },
      child: Text('register_button'.i18n()),
    ),
  ));

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

  void _register(XFile? photo) async {
    int? response = await store.register(photo);
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
                  const SizedBox(height: 5),
                  _messagePhoto,
                  _imageProfile,
                  _messageData,
                  _cpf,
                  _name,
                  _email,
                  _dateBirth,
                  _messagePassword,
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
        child: Container(height: 45.0, color: AppColors.primary),
      ),
    );
  }
}