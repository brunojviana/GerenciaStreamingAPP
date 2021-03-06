import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/features/subscription/domain/model/subscription.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:frontend/src/features/subscription/presentation/viewmodel/register_subscription_viewmodel.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../../domain/model/provider.dart';

class RegisterSubscriptionPage extends StatefulWidget {
  final Provider provider;
  const RegisterSubscriptionPage({ Key? key, required this.provider}) : super(key: key);

  @override
  State<RegisterSubscriptionPage> createState() => _RegisterSubscriptionPageState();
}

class _RegisterSubscriptionPageState extends ModularState<RegisterSubscriptionPage, RegisterSubscriptionViewModel> { 
   late Profile _profile;
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
  late Subscription? _response;
  late List<Subscription> _subs;

  Widget get _provider => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 100,
    child: Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Image.asset(widget.provider.path_image,
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
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 18,
    width: double.infinity,
    child: Text('service_date'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _date => Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
    height: 70,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.accent,
      borderRadius: BorderRadius.circular(5),
    ),
    child: widget.createFormField(
      mask: "##/##/####",
      theme: _theme,
      keyboardType: TextInputType.datetime,
      textInputAction: TextInputAction.next,
      hint: 'service_date_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.date,
      onChange: (value) => store.date = value,
    ),
  );  

  Widget get _messageValue => Container(
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 18,
    width: double.infinity,
    child: Text('service_value'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _value => Container(
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
      hint: 'service_value_hint'.i18n(),
      enabled: !store.isLoading,
      errorText: store.error.value,
      onChange: (value) => store.value = value,
    ),
  ); 
  
  Widget get _messagePayment => Container(
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 18,
    width: double.infinity,
    child: Text('payment_frequency'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
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
          ChoiceChipWidget(paymentFrequency, store),
        ],
      )
  );

  Widget get _messageScreens => Container(
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 18,
    width: double.infinity,
    child: Text('simultaneous_screens'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _screens => Container(
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
      enabled: !store.isLoading,
      errorText: store.error.screens,
      onChange: (value) => store.screens = value,
    ),
  ); 

  Widget get _messageResolution => Container(
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 18,
    width: double.infinity,
    child: Text('maximum_resolution'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
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
        ChoiceChipWidget(resolutionMax, store),
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
        onPressed: () async {
          store.isLoading ? null :
          _profile = await store.getSavedUser(); 
          _response = await _registerSubscription(_profile.id, widget.provider.id!);
          _subs = await store.getSubs(_response!.userId!);
          _showDialog(_response);
        },
        child: Text('store'.i18n()),
      ),
    ),
  );

  Future<Subscription?> _registerSubscription(int userId, int idProvider) async {
    Subscription? response = await store.registerSubscription(userId, idProvider);
    return response;
  }

  void registro(int userId, int idProvider) {
    store.registerSubscription(userId, idProvider);
  }

  Future<void> _showDialog(Subscription? subscription) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: (subscription != null) ? 
            const Icon(Icons.done, size: 40, color: Colors.green) :
            const Icon(Icons.error, size: 40, color: Colors.red),
          content: (subscription != null) ?
            Text('subscription_register_success'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.text, 
              ),
              textAlign: TextAlign.center,
            ) :
            Text('subscription_register_error'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          actions: (subscription != null) ?           
          <Widget>[TextButton(
            child: Text('ok'.i18n().toString()),
              onPressed: () async {
                Navigator.pop(context);
                //Navigator.of(context).pushNamedAndRemoveUntil('/home/subscriptions', (Route<dynamic> route) => true, arguments: _subs);
                Modular.to.pushNamed('/subscriptions/', arguments: _subs);
              },  
            ),
          ] :          
          <Widget>[ TextButton(
              child: Text('cancel'.i18n().toString()),
              onPressed: () async {
                Navigator.pop(context);
                _profile = await store.getSavedUser();
                Modular.to.pushNamed('/', arguments: _profile);
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
  final RegisterSubscriptionViewModel stor;
  const ChoiceChipWidget(this.listChoice, this.stor,{Key? key}) : super(key: key);

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
            if ((selectedChoice == 'Monthly') || (selectedChoice == 'Yearly')) {
              widget.stor.payment = selectedChoice;
            } else {
              widget.stor.resolution = selectedChoice;
            }
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