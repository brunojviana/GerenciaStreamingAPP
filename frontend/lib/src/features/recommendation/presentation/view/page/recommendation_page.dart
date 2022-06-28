import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../../../subscription/domain/model/subscription.dart';
import '../../viewmodel/recommendation_viewmodel.dart';

class RecommendationPage extends StatefulWidget {
  final List<Subscription> subscriptions;
  final String currentAmount;
  const RecommendationPage({Key? key, required this.subscriptions, required this.currentAmount}) : super(key: key);

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends ModularState<RecommendationPage, RecommendationViewModel> {
  late ThemeData _theme;
  late Profile _profile;
  late List<Subscription>? _subscriptionSet;
  late Subscription? _mostUsedSubscription;
  late Subscription? _lessUsedSubscription;
  late double _mostUsedSpendingPerHour;
  late double _lessUsedSpendingPerHour;

  Widget get _messageAmount => Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
    width: double.infinity,
    child: Text('message_amount'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.left,
    ),
  );

  Widget get _amount => Container(
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
      hint: 'currency'.i18n() + widget.currentAmount,
    ),
  );

  Widget get _calculateButton => Center(
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
          setState(() async {
            store.isLoading ? null :          
          _subscriptionSet = await calculateSubset();
          (_subscriptionSet == null) ? 
          _showDialog(_subscriptionSet):
          _mostUsedSubscription = await calculateMostUsed(_subscriptionSet!);
          _lessUsedSubscription = await calculateLessUsed(_subscriptionSet!);
          _mostUsedSpendingPerHour = await calculateSpendingPerHour(_mostUsedSubscription!);
          _lessUsedSpendingPerHour = await calculateSpendingPerHour(_lessUsedSubscription!);  
          });
        },
        child: Text('store'.i18n()),
      ),
    ),
  );

  Widget get _grid => Center(
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5),
      padding: const EdgeInsets.all(40),
      itemCount: (_subscriptionSet == null) ? widget.subscriptions.length : _subscriptionSet!.length,
      itemBuilder: (context,index) {
        final subscription = (_subscriptionSet == null) ?  widget.subscriptions[index] : _subscriptionSet![index];
                
        return GestureDetector(
          onTap: () {
            Modular.to.pushNamed('newcontent', arguments: (_subscriptionSet == null) ? widget.subscriptions[index] : _subscriptionSet![index]);
          },
          child: GridTile(
            header: Text('price'.i18n() + ': ' 'currency'.i18n() + subscription.price.toString()),
            child: Center(
              child: Image.asset(subscription.provider!.path_image!,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            footer: Text('use_time'.i18n() + ':' + subscription.useTime.toString()),
          ),
        );
      },
    ),
  );

  Widget get _mostUsed => Card(
    child: ListTile(
      title: Text(_mostUsedSubscription!.provider!.name!,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
      ),
      subtitle: Text(
        'use_time'.i18n() + ':' + _mostUsedSubscription!.useTime.toString() + '\n' +
        'spending_per_hour'.i18n() + ': ' + 'currency'.i18n() +  
          _mostUsedSpendingPerHour.toString(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.text, 
        ),
      ),
      minLeadingWidth: 80,
        leading: const Icon(Icons.arrow_circle_up, color: Colors.green),
    ),
  ); 

  Widget get _lessUsed => Card(
    child: ListTile(
      title: Text(_lessUsedSubscription!.provider!.name!,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
      ),
      subtitle: Text(
        'use_time'.i18n() + ':' + _lessUsedSubscription!.useTime.toString() + '\n' +
        'spending_per_hour'.i18n() + ': ' + 'currency'.i18n() +  
          _lessUsedSpendingPerHour.toString(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.text, 
        ),
      ),
      minLeadingWidth: 80,
        leading: const Icon(Icons.arrow_circle_down, color: Colors.green),
    ),
  );

  Future<double> calculateCurrentAmount(List<Subscription> subscriptions) async {
    return store.calculateCurrentAmount(subscriptions);
  }

  Future<Subscription?> calculateMostUsed(List<Subscription> subscriptions) async {
    return store.calculateMostUsed(subscriptions);
  }  

  Future<Subscription?> calculateLessUsed(List<Subscription> subscriptions) async {
    return store.calculateLessUsed(subscriptions);
  }

  Future<double> calculateSpendingPerHour(Subscription subscription) async {
    return store.calculateSpendingPerHour(subscription);
  }

  Future<List<Subscription>?> calculateSubset() async {
    return store.calculateSubset();
  }

  Future<void> _showDialog(List<Subscription>? subscriptions) async {
    
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(Icons.error, size: 40, color: Colors.red),
          content: Text('subset_error'.i18n(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
          actions:            
          <Widget>[TextButton(
            child: Text('ok'.i18n().toString()),
              onPressed: () { 
                Navigator.pop(context);
              },  
            ),
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
              Card(child: _messageAmount),
              Card(child: _amount),
              Card(child: _calculateButton),
              Card(child: _grid),
              Card(child: _mostUsed),
              Card(child: _lessUsed),
            ],
          ),
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