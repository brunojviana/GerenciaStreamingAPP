import 'package:flutter/material.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
//import '../../../domain/model/subscription.dart';
import '../../viewmodel/subscription_detail_viewmodel.dart';
import 'list_subscriptions_page.dart';

class SubscriptionDetailPage extends StatefulWidget {
  final Subscription subscription;
  const SubscriptionDetailPage({Key? key, required this.subscription}) : super(key: key);

  @override
  State<SubscriptionDetailPage> createState() => _SubscriptionDetailPageState();
}

class _SubscriptionDetailPageState extends ModularState<SubscriptionDetailPage, SubscriptionDetailViewModel> {
  late ThemeData _theme;

  Widget get _provider => Container(
    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
    height: 100,
    child: ListTile(
      visualDensity: const VisualDensity(vertical: 1),
      title: Text(widget.subscription.nameProvider,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
      ),
      subtitle: Text(widget.subscription.categoryProvider.i18n(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.text, 
        ),
      ),
      leading: Image.asset(widget.subscription.pathLogo,
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      ),
    ),
  );

  Widget get _subscriptionDate => Container(
    margin: const EdgeInsets.fromLTRB(35, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('signature_date'.i18n() + ': ' +
                  widget.subscription.signatureDate.day.toString() + '/' +
                  widget.subscription.signatureDate.month.toString() + '/' +
                  widget.subscription.signatureDate.year.toString(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    ); 

  Widget get _subscriptionTime => Container(
    margin: const EdgeInsets.fromLTRB(35, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('subscription_time'.i18n(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    ); 

  Widget get _screens => Container(
    margin: const EdgeInsets.fromLTRB(35, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('screens'.i18n() + ': ' + widget.subscription.screens.toString(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    );

  Widget get _maxResolution => Container(
    margin: const EdgeInsets.fromLTRB(35, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('resolution'.i18n() + ': ' + widget.subscription.maxResolution.toString(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    );

  Widget get _price => Container(
    margin: const EdgeInsets.fromLTRB(35, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('price'.i18n() + ': ' + 'currency'.i18n() +
                  widget.subscription.price.toString(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    );

  Widget get _paymentFrequency => Container(
    margin: const EdgeInsets.fromLTRB(35, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('frequency'.i18n() + ': ' + widget.subscription.periodPayment.i18n(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    );

  Widget get _content => Container(
    margin: const EdgeInsets.fromLTRB(35, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('consumedContent'.i18n() + ': ' + widget.subscription.content.toString(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    );

  Widget get _useTime => Container(
    margin: const EdgeInsets.fromLTRB(35, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('use_time'.i18n() + ': ' +
                  widget.subscription.time.inHours.toString() + 'hours'.i18n(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    );

  Widget get _status => Container(
    margin: const EdgeInsets.fromLTRB(35, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('status'.i18n() + ': ' + widget.subscription.status,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    );

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('subscription_detail'.i18n(), 
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight, 
            ),
          ),
        ),
      body: Column(
        children: [
          _provider,
          _subscriptionDate,
          _subscriptionTime,
          _screens,
          _maxResolution,
          _price,
          _paymentFrequency,
          _content,
          _useTime,
          _status,
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.edit),
            backgroundColor: AppColors.primary,
            onPressed: () {
              Modular.to.pushNamed('editSubscription');
            },
          ),
          /*const SizedBox(
            height: 50,
            width: 20,
          ),          
          FloatingActionButton(
            child: const Icon(Icons.delete),
            backgroundColor: AppColors.primary,
            onPressed: () {
              Modular.to.pushNamed('deleteSubscription');
            },
          ),*/
        ],
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