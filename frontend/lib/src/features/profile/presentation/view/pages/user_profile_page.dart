import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localization/localization.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../viewmodel/user_profile_viewmodel.dart';

class UserProfilePage extends StatefulWidget {
  final Profile profile;
  const UserProfilePage({Key? key, required this.profile}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends ModularState<UserProfilePage, UserProfileViewModel> {
  late ThemeData _theme;
  XFile? _photo;

  Widget get _messagePhoto => Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        height: 18,
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
    
  Widget get _messageCpf => Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
    width: double.infinity,
    child: Text('cpf'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _cpfField => Container(
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
      hint: widget.profile.cpf,
    ),
  );

   Widget get _messageName => Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
    width: double.infinity,
    child: Text('name'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _nameField => Container(
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
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      hint: widget.profile.name,
    ),
  );

  Widget get _messageBirthDate => Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
    width: double.infinity,
    child: Text('birthdate'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _birthDateField => Container(
    alignment: Alignment.center,
    height: 70,
    margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
    decoration: BoxDecoration(
      color: AppColors.accent,
      borderRadius: BorderRadius.circular(5),
    ),
    child: widget.createFormField(
      theme: _theme,
      keyboardType: TextInputType.datetime,
      textInputAction: TextInputAction.next,
      hint: widget.profile.dateBirth,
    ),
  );


  Widget get _messageEmail => Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
    width: double.infinity,
    child: Text('e-mail'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _usermail => Container(
    margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
    alignment: Alignment.center,
    height: 70,
    decoration: BoxDecoration(
      color: AppColors.accent,
      borderRadius: BorderRadius.circular(5),
    ),
    child: widget.createFormField(
      theme: _theme,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      hint: widget.profile.email,
    ),
  );

  Widget get _changePassword => Column(
    children: [
      IconButton(
        iconSize: 30,
        onPressed: () {
          Modular.to.pushNamed('changePassword', arguments: widget.profile);
        },
        icon: Image.asset('lib/assets/images/senha.png'),
      ),
      Text('change_password'.i18n()),
    ],
  );

  Widget get _saveChanges => Column(
    children: [
      IconButton(
        iconSize: 30,
        onPressed: () async {
          int? res = await store.editProfile(_photo, widget.profile.password!);
        },
        icon: const Icon(Icons.save, color: Colors.blue),
      ),
      Text('save_changes'.i18n()),
    ],
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

   @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

  return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('my_informations'.i18n(),  
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
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    _messagePhoto,
                    _imageProfile,
                    _messageCpf,
                    _cpfField,
                    _messageName,
                    _nameField,
                    _messageBirthDate,
                    _birthDateField,
                    _messageEmail,
                    _usermail,
                  ],
                ),
              ),
            );
          })
        ),
      ),
      persistentFooterButtons: [_saveChanges, _changePassword],
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