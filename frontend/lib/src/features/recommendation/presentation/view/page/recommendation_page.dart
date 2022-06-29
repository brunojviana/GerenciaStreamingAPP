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
  const RecommendationPage({Key? key, required this.subscriptions}) : super(key: key);

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends ModularState<RecommendationPage, RecommendationViewModel> {
  late ThemeData _theme;
  late Profile _profile;
  late List<Subscription>? _response;
  late List<Subscription>? _subscriptionSet;
  late double _currentAmount;
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
      textAlign: TextAlign.center,
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
      hint: 'currency'.i18n() + _currentAmount.toStringAsFixed(2),
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
        onPressed: () async {
          store.isLoading ? null :          
          _response = await calculateSubset();
          (_response == null) ? 
          _showDialog(_subscriptionSet):
          setState(() {
            _subscriptionSet = _response;
            _currentAmount = calculateCurrentAmount(_subscriptionSet!);
            _mostUsedSubscription = calculateMostUsed(_subscriptionSet!);
            _lessUsedSubscription = calculateLessUsed(_subscriptionSet!);
            _mostUsedSpendingPerHour = calculateSpendingPerHour(_mostUsedSubscription!);
            _lessUsedSpendingPerHour = calculateSpendingPerHour(_lessUsedSubscription!);
          });
        },
        child: Text('send'.i18n()),
      ),
    ),
  );

  Widget get _suggestedSubset => Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
    width: double.infinity,
    child: Text('suggested_subset'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.center,
    ),
  );

  Widget get _calculatedAmount => Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
    width: double.infinity,
    child: Center(
      child: Column(
        children: [
          Text('monthly_spending'.i18n(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
          Text('currency'.i18n() + _currentAmount.toStringAsFixed(2),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );

  Widget get _grid => Center(
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5),
      padding: const EdgeInsets.fromLTRB(70,10,70,10),
      itemCount: _subscriptionSet!.length,
      itemBuilder: (context,index) {
        final subscription = _subscriptionSet![index];
                
        return GestureDetector(
          onTap: () {
            Modular.to.pushNamed('/subscriptions/detailsubscription', arguments: _subscriptionSet![index]);
          },
          child: GridTile(
            child: Center(
              child: Image.asset(subscription.provider!.path_image,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    ),
  );

  Widget get _mostUsed => ListTile(
    title: Text(_mostUsedSubscription!.provider!.name!,
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
    ),
    subtitle: Text(
      'use_time'.i18n() + ': ' + _mostUsedSubscription!.useTime.toString() + 'hours'.i18n() + '\n' +
      'spending_per_hour'.i18n() + ': ' + 'currency'.i18n() +  
        _mostUsedSpendingPerHour.toStringAsFixed(2),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.text, 
      ),
    ),
    leading: const Icon(Icons.arrow_circle_up, color: Colors.green, size: 40),
  ); 

  Widget get _lessUsed => ListTile(
    title: Text(_lessUsedSubscription!.provider!.name!,
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
    ),
    subtitle: Text(
      'use_time'.i18n() + ': ' + _lessUsedSubscription!.useTime.toString() + 'hours'.i18n() + '\n' +
      'spending_per_hour'.i18n() + ': ' + 'currency'.i18n() +  
        _lessUsedSpendingPerHour.toStringAsFixed(2),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.text, 
      ),
    ),
    leading: const Icon(Icons.arrow_circle_down, color: Colors.red, size: 40),
  );

  double calculateCurrentAmount(List<Subscription> subscriptions) {
    return store.calculateCurrentAmount(subscriptions);
  }

  Subscription? calculateMostUsed(List<Subscription> subscriptions) {
    return store.calculateMostUsed(subscriptions);
  }  

  Subscription? calculateLessUsed(List<Subscription> subscriptions) {
    return store.calculateLessUsed(subscriptions);
  }

  double calculateSpendingPerHour(Subscription subscription) {
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
    _subscriptionSet = widget.subscriptions;
    _mostUsedSubscription = calculateMostUsed(_subscriptionSet!);
    _mostUsedSpendingPerHour = calculateSpendingPerHour(_mostUsedSubscription!);
    _lessUsedSubscription = calculateLessUsed(_subscriptionSet!);
    _lessUsedSpendingPerHour = calculateSpendingPerHour(_lessUsedSubscription!);
    _currentAmount = calculateCurrentAmount(_subscriptionSet!);
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('recommendations_title'.i18n(), 
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
              Card(child: Column(
                children: [_messageAmount, _amount, _calculateButton])),
              Card(child: Column(
                children: [_suggestedSubset, _calculatedAmount, _grid])),
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