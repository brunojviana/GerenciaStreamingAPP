import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/features/subscription/domain/model/provider.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../../../subscription/domain/model/subscription.dart';
import '../../../domain/model/content.dart';
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
  late Content? _response;
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
          child: Image.asset(widget.subscription.provider!.path_image!,
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
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      hint: 'name'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.name,
      onChange: (value) => store.name = value,
    ),
  );  

  Widget get _messageCategory => Container(
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
      onPressed: () async {
        store.isLoading ? null : 
        _response = await _registerContent(widget.subscription.id!);
        _showDialog(_response);
      },
      child: Text('store'.i18n()),
    ),
  );
  

  Future<Content?> _registerContent(int _subscriptionId) async {
    Content? response = await store.registerContent(_subscriptionId);
    return response;
  }

  Future<void> _showDialog(Content? content) async {
    //Content? content = widget.content;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: (content != null) ? 
            const Icon(Icons.done, size: 40, color: Colors.green) :
            const Icon(Icons.error, size: 40, color: Colors.red),
          content: (content != null) ?
            Text('content_register_success'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.text, 
              ),
              textAlign: TextAlign.center,
            ) :
            Text('content_register_error'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          actions: (content != null) ?           
          <Widget>[TextButton(
            child: Text('ok'.i18n().toString()),
              onPressed: () { 
                Modular.to.pop(context);
                Modular.to.pushNamed('detailcontent', arguments: content);
              },  
            ),
          ] :          
          <Widget>[TextButton(
              child: Text('cancel'.i18n().toString()),
              onPressed: () async {
                _profile = await store.getSavedUser();
                Modular.to.pop(context);
                Modular.to.pushNamed('/', arguments: _profile);
              },  
            ),
            TextButton(
              child: Text('ok'.i18n().toString()),
              onPressed: () {
                Modular.to.pop(context);
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
          padding: const EdgeInsets.all(10.0),
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