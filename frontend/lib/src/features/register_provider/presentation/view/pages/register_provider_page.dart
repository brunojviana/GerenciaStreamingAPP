import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:frontend/src/features/register_provider/presentation/viewmodel/register_provider_viewmodel.dart';

class RegisterProviderPage extends StatefulWidget {
  const RegisterProviderPage({Key? key}) : super(key: key);

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
    'cat_others'.i18n(),
  ];

  late ThemeData _theme;

  Widget get _messenger_logo => Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        height: 25,
        width: double.infinity,
        child: Text(
          'upload_logo'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
          ),
          textAlign: TextAlign.left,
        ),
      );

  Widget get _logoButton => Center(
        child: Container(
            margin: const EdgeInsets.fromLTRB(140, 0, 140, 0),
            height: 90,
            width: double.infinity,
            child: SizedBox(
                height: 30,
                width: 30,
                child: IconButton(
                  icon: Image.asset('lib/assets/images/adicionar-imagem.png'),
                  onPressed: () {
                    //TODO ARQUIVOS
                  },
                ))),
      );

  Widget get _messenger_provider => Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        height: 20,
        width: double.infinity,
        child: Text(
          'name_logo'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
          ),
          textAlign: TextAlign.left,
        ),
      );

  Widget get _provider => widget.createFormField(
        theme: _theme,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        hint: 'name_logo_hint'.i18n(),
        enabled: !store.isLoading,
        errorText: store.error.name,
        onChange: (value) => store.name = value,
      );

  Widget get _messenger_category => Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        height: 25,
        width: double.infinity,
        child: Text(
          'provider_category'.i18n(),
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
          ),
          textAlign: TextAlign.left,
        ),
      );

  Widget get _category => Container(
      alignment: Alignment.center,
      child: Wrap(
        direction: Axis.vertical,
        spacing: 10.0,
        runSpacing: 10.0,
        children: <Widget>[
          choiceChipWidget(category),
        ],
      ));

  Widget get _registerButton => Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(30, 15, 30, 5),
          width: 128,
          height: 41,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppColors.primaryLight),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            onPressed: () {
               Modular.to.pushNamed('subscription');
            },
            child: Text('next'.i18n()),
          ),
        ),
      );

  void _registerProvider() async {
    int? response = await store.registerProvider();
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
                  _messenger_logo,
                  _logoButton,
                  _messenger_provider,
                  _provider,
                  _messenger_category,
                  _category,
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
        child: SizedBox(
          height: 47.0,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Positioned(
                bottom: 20,
                child: IconButton(
                    icon: const Icon(Icons.home, color: AppColors.textLight),
                    onPressed: () {
                      Modular.to.pushNamed('/auth');
                    }),
              )),
        ),
      ),
    );
  }
}

class choiceChipWidget extends StatefulWidget {
  final List<String> reportList;
  choiceChipWidget(this.reportList);

  @override
  _choiceChipWidgetState createState() => new _choiceChipWidgetState();
}

class _choiceChipWidgetState extends State<choiceChipWidget> {
  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: ChoiceChip(
            label: Text(item),
            labelStyle: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight,
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
