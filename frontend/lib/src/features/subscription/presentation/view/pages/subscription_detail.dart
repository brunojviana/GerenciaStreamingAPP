import 'package:flutter/material.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../../domain/model/subscription.dart';
import '../../viewmodel/subscription_detail_viewmodel.dart';

class SubscriptionDetailPage extends StatefulWidget {
  final Subscription subscription;
  const SubscriptionDetailPage({Key? key, required this.subscription}) : super(key: key);

  @override
  State<SubscriptionDetailPage> createState() => _SubscriptionDetailPageState();
}

class _SubscriptionDetailPageState extends ModularState<SubscriptionDetailPage, SubscriptionDetailViewModel> {
  late ThemeData _theme;
  late Profile _profile;
  late DateTime data;
  Subscription? sub;
  late List<Subscription> subs = [];


  Widget get _provider => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 100,
    child: Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Image.asset(widget.subscription.provider!.path_image,
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

  Widget get _subscriptionDate => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.calendar_month, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('signature_date'.i18n() + ': ' +
                      data.day.toString() + '/' +
                      data.month.toString() + '/' +
                      data.year.toString(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ); 

  Widget get _subscriptionTime => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.timelapse, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('subscription_time'.i18n(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ); 

  Widget get _screens => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.screen_share_outlined, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('screens'.i18n() + ': ' + widget.subscription.screens.toString(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );

  Widget get _maxResolution => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.hd, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('resolution'.i18n() + ': ' + widget.subscription.maxResolution.toString(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );

  Widget get _price => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.monetization_on, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('price'.i18n() + ': ' + 'currency'.i18n() +
                      widget.subscription.price.toString(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );

  Widget get _paymentFrequency => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.payment, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('frequency'.i18n() + ': ' + widget.subscription.periodPayment!.i18n(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );

  Widget get _content => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.live_tv, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('consumedContent'.i18n() + ': ' + widget.subscription.content.toString(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );

  Widget get _useTime => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.access_time, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('use_time'.i18n() + ': ' +
                      widget.subscription.useTime.toString() + 'hours'.i18n(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );

  Widget get _status => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.offline_pin, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('status'.i18n() + ': ' + _verifyStatus(widget.subscription.status!),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );

  Widget get _editButton => Column(
    children: [
      IconButton(
        iconSize: 30,
        onPressed: () {
          Modular.to.pushNamed('editsubscription', arguments: widget.subscription);
        },
        icon: const Icon(Icons.edit),
      ),
      Text('edit'.i18n()),
    ],
  );

  Widget get _cancelButton => Column(
    children: [
      IconButton(
        iconSize: 30,
        onPressed: () async {
          if (sub == null && (widget.subscription.status == 1)){
            sub = await store.switchStatus(widget.subscription, 0);
            _showDialog(1);
          } else {
            _showDialog(0);
          }
        },
        icon: const Icon(Icons.cancel, color: Colors.red),
      ),
      Text('cancel'.i18n()),
    ],
  );

  Widget get _deleteButton => Column(
    children: [
      IconButton(
        iconSize: 30,
        onPressed: () async {
          int res = await store.deleteSubscription(widget.subscription.id);
          subs = await store.loadSubscriptions(widget.subscription.userId);
          Navigator.pop(context);
          //Navigator.of(context).pushNamedAndRemoveUntil('/home/subscriptions/', (Route<dynamic> route) => false, arguments: subs);
          Modular.to.pushNamed('/subscriptions/', arguments: subs);
        },
        icon: const Icon(Icons.delete),
      ),
      Text('delete'.i18n()),
    ],
  );

  String _verifyStatus(int status) {
    if (widget.subscription.status == 0) {
      return 'status_inactive'.i18n();
    }
    else {
      return 'status_active'.i18n();
    }
  }
  
  Future<void> _showDialog(int res) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: (res == 1) ? 
            const Icon(Icons.done, size: 40, color: Colors.green) :
            const Icon(Icons.error, size: 40, color: Colors.red),
          content: (res == 1) ?
            Text('subscription_update_success'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.text, 
              ),
              textAlign: TextAlign.center,
            ) :
            Text('subscription_update_error'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          actions: <Widget>[
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
    data = DateTime.parse(widget.subscription.signatureDate!);

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
        centerTitle: true,
        ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(child: _provider),
              Card(child: _subscriptionDate),
              Card(child: _subscriptionTime),
              Card(child: _screens),
              Card(child: _maxResolution),
              Card(child: _price),
              Card(child: _paymentFrequency),
              Card(child: _content),
              Card(child: _useTime),
              Card(child: _status),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        _editButton,
        _cancelButton,
        _deleteButton
      ],
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