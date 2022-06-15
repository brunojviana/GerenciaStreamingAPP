import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/features/auth/domain/model/profile.dart';
import 'package:frontend/src/features/subscription/domain/model/subscription.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localization/localization.dart';
import 'package:frontend/src/features/subscription/presentation/viewmodel/register_provider_viewmodel.dart';
import '../../../domain/model/provider.dart';

class RegisterProviderPage extends StatefulWidget {
  final Profile profile;
  const RegisterProviderPage({Key? key, required this.profile}) : super(key: key);

  @override
  State<RegisterProviderPage> createState() => _RegisterProviderPageState();
}

class _RegisterProviderPageState extends ModularState<RegisterProviderPage, RegisterProviderViewModel> {
  List<String> category = [
    'cat_movies_and_series'.i18n(),
    'cat_songs'.i18n(),
    'cat_sports'.i18n(),
    'cat_anime'.i18n(),
    'cat_journalism'.i18n(),
    'cat_channels'.i18n(),
    'cat_games'.i18n(),
    'cat_others'.i18n(),
  ];

  late ThemeData _theme;
  XFile? _image;

  Widget get _imageLogo =>  Center(
    child: ListTile(
      visualDensity: const VisualDensity(vertical: 3),
    	leading: Image.asset('lib/assets/images/adicionar-imagem.png'),
      title: Text('upload_logo'.i18n(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.text,
        ),
        textAlign: TextAlign.left,
      ),
      onTap: () {
        _selectPhoto(ImageSource.gallery);
      },
    	trailing: _image != null ? Image.file(File(_image!.path)) : null,
    ),
	);

  Widget get _messageProvider => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
    height: 20,
    width: double.infinity,
    child: Text('name_logo'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.text,
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _provider => Container(
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
      hint: 'name_logo_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.name,
      onChange: (value) => store.name = value,
    ),
  );  

  Widget get _messageCategory => Container(
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 20,
    width: double.infinity,
    child: Text('provider_category'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.text,
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _category=> Container( 
    alignment: Alignment.center,
    child: Wrap(
      spacing: 20.0,
      runSpacing: 20.0,
      children: <Widget>[
        ChoiceChipWidget(category),
      ],
    )
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
          onPressed: () {
            _registerProvider(_image);
            Modular.to.pushNamed('newsubscription', arguments: Subscription(
              provider: Provider(
                pathLogo: _image!.path,
                name: store.name,
                category: store.category),
              ));
            },
          child: Text('next'.i18n(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );

  void _selectPhoto(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
	
    try{
      XFile? file = await picker.pickImage(source: source);
      if (file != null) {
        setState(() => _image = file);
      } 
    } catch (e) {
      _image = null;
    }
  }

  void _registerProvider(XFile? _logo) async {
    int? response = await store.registerProvider(_logo);
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text(
          'register_provider'.i18n(),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,             
                children: [
                  Column(
                    children: [
                      _imageLogo,
                      _messageProvider,
                      _provider,
                      _messageCategory,
                      _category,
                      _registerButton
                    ],
                  ),  
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

 class ChoiceChipWidget extends StatefulWidget {
  final List<String> listChoice;
  const ChoiceChipWidget(this.listChoice, {Key? key}) : super(key: key);

  @override
  _ChoiceChipWidgetState createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  
  String selectedChoice = "";
  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.listChoice) { 
      choices.add(Container(
        margin: const EdgeInsets.fromLTRB(4, 4, 4, 4), 
        child: ChoiceChip(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          label: Container(
            alignment: Alignment.center,
            width: 150.0,
            height: 55.0,
            child: Text(item,
              style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight,
              ),
            ),
          ),
          backgroundColor: (AppColors.accent),
          selectedColor: (AppColors.primaryLight),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}