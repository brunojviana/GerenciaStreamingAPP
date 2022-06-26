import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/features/subscription/domain/model/subscription.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../viewmodel/edit_subscription_viewmodel.dart';

class EditSubscriptionPage extends StatefulWidget {
  final Subscription subscription;
  const EditSubscriptionPage({ Key? key, required this.subscription}) : super(key: key);

  @override
  State<EditSubscriptionPage> createState() => _EditSubscriptionPageState();
}

class _EditSubscriptionPageState extends ModularState<EditSubscriptionPage, EditSubscriptionViewModel> { 
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
  late Subscription? response;

  Widget get _provider => Container(
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

  Widget get _messageDate => Container(
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 18,
    width: double.infinity,
    child: Text('signature_date'.i18n(),
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
      theme: _theme,
      keyboardType: TextInputType.datetime,
      textInputAction: TextInputAction.next,
      hint: 'widget.subscription.signatureDate!.day.toString()' + '/' +
            'widget.subscription.signatureDate!.month.toString()' + '/' +
            'widget.subscription.signatureDate!.year.toString()',
      enabled: !store.isLoading,
      errorText: store.error.date,
      onChange: (value) => store.date = value,
    ),
  );  

  Widget get _messageValue => Container(
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 18,
    width: double.infinity,
    child: Text('price'.i18n(),
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
      hint: 'currency'.i18n() + widget.subscription.price!.toString(),
      enabled: !store.isLoading,
      errorText: store.error.value,
      onChange: (value) => store.value = value,
    ),
  ); 
  
  Widget get _messagePayment => Container(
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 18,
    width: double.infinity,
    child: Text('payment_frequency_message'.i18n(),
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
          ChoiceChipWidget(paymentFrequency),
        ],
      )
  );

  Widget get _messageScreens => Container(
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 18,
    width: double.infinity,
    child: Text('screens'.i18n(),
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
      hint: widget.subscription.screens.toString(),
      enabled: !store.isLoading,
      errorText: store.error.screens,
      onChange: (value) => store.screens = value,
    ),
  ); 

  Widget get _messageResolution => Container(
    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 18,
    width: double.infinity,
    child: Text('resolution'.i18n(),
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
        onPressed: () async {
          store.isLoading ? null :
          _profile = await store.getSavedUser(); 
          response = await _editSubscription(
            _profile.id!,
             widget.subscription.provider!.id!,
             widget.subscription.content!,
             widget.subscription.useTime!,
             widget.subscription.status!);
          _showDialog(response);
        },
        child: Text('store'.i18n()),
      ),
    ),
  );

  Future<Subscription?> _editSubscription(
    int userId, 
    int idProvider, 
    int content, 
    double useTime, 
    int status) async {
    Subscription? response = await store.editSubscription(
      userId, 
      idProvider, 
      content, 
      useTime, 
      status);
    return response;
  }

  Future<void> _showDialog(Subscription? subscription) async {
    //Subscription? subscription = widget.subscription;
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: (subscription != null) ? 
            const Icon(Icons.done, size: 40, color: Colors.green) :
            const Icon(Icons.error, size: 40, color: Colors.red),
          content: (subscription != null) ?
            Text('subscription_edition_success'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.text, 
              ),
              textAlign: TextAlign.center,
            ) :
            Text('subscription_edition_error'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          actions: (subscription != null) ?           
          <Widget>[TextButton(
            child: Text('ok'.i18n().toString()),
              onPressed: () { 
                Navigator.pop(context);
                Modular.to.pushNamed('detailsubscription', arguments: subscription);
              },  
            ),
          ] :          
          <Widget>[ TextButton(
              child: Text('cancel'.i18n().toString()),
              onPressed: () {
                Navigator.pop(context);
                Modular.to.pushNamed('detailsubscription', arguments: widget.subscription);
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
        title: Text('edit_subscription'.i18n(), 
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