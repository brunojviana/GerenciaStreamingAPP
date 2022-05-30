import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../subscription/presentation/viewmodel/register_subscription_viewmodel.dart';

class Subscription {
    String pathLogo;
    String nameProvider;
    String categoryProvider;

    Subscription(
    {required this.pathLogo,
     required this.nameProvider,
     required this.categoryProvider,
    });
}

class RegisterContent extends StatefulWidget {
  const RegisterContent({Key? key}) : super(key: key);

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends ModularState<RegisterContent, RegisterSubscriptionViewModel> { //Alterar Subscription
  
  late ThemeData _theme;
  late List<Subscription> _subscriptions;
  
  List<String> listContent = [
    'cat_movies'.i18n(),
    'cat_series'.i18n(),
    'cat_sports'.i18n(),
    'cat_journalism'.i18n(),
    'cat_anime'.i18n(),
    'cat_channels'.i18n(),
    'cat_songs'.i18n(),
    'cat_others'.i18n(),
  ];
    
  Widget get _dataSubscription => Container( 
    child:(Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(80, 20, 0, 15),
            width: 45,
            height: 45,
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('lib/assets/images/globo.png'), // TODO: Path_Logo    
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("GloboPlay", // TODO: nameProvider   
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text, 
                  ),
                ),
                Text("Categoria: Outros", // TODO: categoryProvider   
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 13,
                  color: AppColors.text, 
                  ),
                ),       
              ],
            ) ,
          ),
        ],
      )),
    );

  Widget get _message_name => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 40,
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
    hint: 'content_name_hint'.i18n(),
    enabled: !store.isLoading,
  );

  Widget get _message_category => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
    height: 40,
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

  Widget get _registerServiceButton =>Container(
    margin: const EdgeInsets.fromLTRB(10, 40, 30, 10),
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
        store.isLoading ? null : _registerSubscription();
      },
      child: Text('store'.i18n()),
    ),
  );
  

  void _registerSubscription() async {
    int? response = await store.registerSubscription();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

     _subscriptions = [
      Subscription(
        pathLogo: 'lib/assets/images/perfil.png',
        nameProvider: 'GloboPlay',
        categoryProvider: 'Others',
      )
     ];

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
                          _dataSubscription,
                        ],
                      ),
                      Column(
                        children: [
                          SingleChildScrollView(
                            child: Observer(builder: (_) {
                              return Form(   
                                child: Column(
                                  children: [
                                  _message_name,
                                  _name,
                                  _message_category,
                                  ],     
                                ),
                              );  
                            }),
                          ), 
                        ],
                      ),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 20.0,
                        children: <Widget>[
                          choiceChipWidget(listContent),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _registerServiceButton
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
        child: SizedBox(
          height: 47.0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Positioned(
              bottom: 20,
              child: IconButton(
                icon: const Icon(Icons.home, color: AppColors.textLight),
                onPressed: () {
                  Modular.to.pushNamed('/home');
                }
              ),  
            )
          ),
        ),
      ),
    );
    }
  }

class choiceChipWidget extends StatefulWidget {
    final List<String> listChoice;
    choiceChipWidget(this.listChoice);

  @override
  _choiceChipWidgetState createState() => new _choiceChipWidgetState();
}

class _choiceChipWidgetState extends State<choiceChipWidget> {
  
  String selectedChoice = "";
  _buildChoiceList() {
    List<Widget> choices = [];
    widget.listChoice.forEach((item) { 
      choices.add(Container(
        margin: const EdgeInsets.fromLTRB(4, 4, 4, 4), 
        child: ChoiceChip(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          label: Container(
            alignment: Alignment.center,
            width: 140.0,
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
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}