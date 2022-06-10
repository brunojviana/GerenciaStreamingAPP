import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:frontend/src/features/subscription/presentation/viewmodel/register_subscription_viewmodel.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../../domain/model/provider.dart';

class RegisterSubscriptionPage extends StatefulWidget {
  final Provider provider;
  //final Profile profile;
  const RegisterSubscriptionPage({ Key? key, required this.provider, /*required this.profile*/}) : super(key: key);

  @override
  State<RegisterSubscriptionPage> createState() => _RegisterSubscriptionPageState();
}

class _RegisterSubscriptionPageState extends ModularState<RegisterSubscriptionPage, RegisterSubscriptionViewModel> { 
   List<String> paymentFrequency = [
    'monthly'.i18n(),
    'yearly'.i18n(),
  ];

  List<String> resolutionMax = [
    '4K'.i18n(),
    'Full HD'.i18n(),
    'HD'.i18n(),
    'other'.i18n(),
  ];

  late ThemeData _theme;

  Widget get _provider => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 100,
    child: Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Image.asset(widget.provider.pathLogo!,
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
              Text(widget.provider.name!,
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text, 
                ),
                textAlign: TextAlign.left,
              ),
              Text(widget.provider.category!.i18n(),
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

  Widget get _messageDate => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 20,
    width: double.infinity,
    child: Text('service_date'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _date=> widget.createFormField(
    theme: _theme,
    keyboardType: TextInputType.datetime,
    textInputAction: TextInputAction.next,
    hint: 'service_date_hint'.i18n(),
    enabled: !store.isLoading,
    errorText: store.error.date,
    onChange: (value) => store.date = value,
  );

  Widget get _messageValue => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 20,
    width: double.infinity,
    child: Text('service_value'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _value=> widget.createFormField(
    theme: _theme,
    keyboardType: TextInputType.datetime,
    textInputAction: TextInputAction.next,
    hint: 'service_value_hint'.i18n(),
    enabled: !store.isLoading,
    errorText: store.error.value,
    onChange: (value) => store.value = value,
  );
  
  Widget get _messagePayment => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
    height: 20,
    width: double.infinity,
    child: Text('payment_frequency'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _payment=> Container( 
    alignment: Alignment.center,
    child: Wrap(
        spacing: 20.0,
        runSpacing: 20.0,
        children: <Widget>[
          ChoiceChipWidget(paymentFrequency),
        ],
      )
  );

  Widget get _messageScreens => Container(
    margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
    height: 20,
    width: double.infinity,
    child: Text('simultaneous_screens'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _screens=> widget.createFormField( 
    theme: _theme,
    keyboardType: TextInputType.datetime,
    textInputAction: TextInputAction.next,
    enabled: !store.isLoading,
    errorText: store.error.screens,
    onChange: (value) => store.screens = value,
  );

  Widget get _messageResolution => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
    height: 20,
    width: double.infinity,
    child: Text('maximum_resolution'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _resolution=> Container( 
    alignment: Alignment.center,
    child: Wrap(
      spacing: 20.0,
      runSpacing: 20.0,
      children: <Widget>[
        ChoiceChipWidget(resolutionMax),
      ],
    )
  );

  Widget get _registerServiceButton =>Center(child: Container(
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
            store.isLoading ? null : _registerSubscription(/*widget.profile.cpf!*/);
          },
          child: Text('store'.i18n()),
        ),
      ),
  );

  void _registerSubscription(/*String cpf*/) async {
    int? response = await store.registerSubscription();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('set_service'.i18n(), 
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
                  Card(child: _provider),
                  _messageDate,
                  _date,
                  _messageValue,
                  _value,
                  _messagePayment,
                  _payment,
                  _messageScreens,
                  _screens,
                  _messageResolution,
                  _resolution,
                  _registerServiceButton,
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
                  Modular.to.pushNamed('/home');
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