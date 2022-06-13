import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../../../auth/domain/model/user.dart';
import '../../../../subscription/domain/model/subscription.dart';
import '../../viewmodel/register_content_viewmodel.dart';

class RegisterContentPage extends StatefulWidget {
  final Subscription subscription;
  const RegisterContentPage({Key? key, required this.subscription}) : super(key: key);

  @override
  State<RegisterContentPage> createState() => _RegisterContentPageState();
}

class _RegisterContentPageState extends ModularState<RegisterContentPage, RegisterContentViewModel> { //Alterar Subscription
  late ThemeData _theme;
  late Profile _profile;

  List<String> listCategory = [
    'cat_movies'.i18n(),
    'cat_series'.i18n(),
    'cat_sports'.i18n(),
    'cat_journalism'.i18n(),
    'cat_anime'.i18n(),
    'cat_channels'.i18n(),
    'cat_songs'.i18n(),
    'cat_others'.i18n(),
  ];
    
  Widget get _subscription => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 100,
    child: Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Image.asset(widget.subscription.provider!.pathLogo!,
            width: 80,
            height: 80,
            fit: BoxFit.scaleDown,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.subscription.provider!.name!,
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text, 
                ),
                textAlign: TextAlign.left,
              ),
              Text(widget.subscription.provider!.category!.i18n(),
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text, 
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        )
      ],
    ), 
  );


  Widget get _messageName => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 20,
    width: double.infinity,
    child: Text('content_name'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _name => widget.createFormField(
    theme: _theme,
    keyboardType: TextInputType.name,
    textInputAction: TextInputAction.next,
    hint: 'name'.i18n(),
    enabled: !store.isLoading,
  );

  Widget get _messageCategory => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
    height: 20,
    width: double.infinity,
    child: Text('content_category'.i18n(),
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
          ChoiceChipWidget(listCategory),
      ],
    )
  );  

  Widget get _registerContentButton =>Container(
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
        store.isLoading ? null : _registerContent();
      },
      child: Text('store'.i18n()),
    ),
  );
  

  void _registerContent() async {
    await store.registerContent(
      const User(usermail: 'bruno@email.com', password: '123456', token: 'token'),
      widget.subscription);
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('register_content'.i18n(), 
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
          child: Observer(builder: (_) {
            return Form(   
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,           
                children: [
                  Column(    
                    children: [
                      Column(
                        children: [
                          Card(child: _subscription),
                          _messageName,
                          _name,
                          _messageCategory,
                          _category,
                          _registerContentButton,
                        ],
                      ),
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
                onPressed: () async {
                  _profile = await store.getSavedUser();
                  Modular.to.pushNamed('/home', arguments: _profile);
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
            width: 130.0,
            height: 40.0,
            child: Text(item,
              style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 14,
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