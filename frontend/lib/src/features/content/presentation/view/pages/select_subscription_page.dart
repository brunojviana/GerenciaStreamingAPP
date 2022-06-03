import 'package:flutter/material.dart';
import 'package:frontend/src/features/subscription/domain/model/subscription.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../subscription/domain/model/provider.dart';
import '../../viewmodel/select_subscription_viewmodel.dart';

class SelectSubscriptionPage extends StatefulWidget {
  const SelectSubscriptionPage({Key? key}) : super(key: key);

  @override
  State<SelectSubscriptionPage> createState() => _SelectSubscriptionPageState();
}

class _SelectSubscriptionPageState extends ModularState<SelectSubscriptionPage, SelectSubscriptionViewModel> {
  late ThemeData _theme;
  late List<Subscription> _subscriptions;
  
  Widget get _message => Container(
    margin: const EdgeInsets.fromLTRB(10, 100, 10, 10),
    height: 20,
    width: double.infinity,
    child: Text('select_subscription_hint'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.center,
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
      itemCount: _subscriptions.length,
      itemBuilder: (context,index) {
        final subscription = _subscriptions[index];
                
        return GestureDetector(
          onTap: () {
            Modular.to.pushNamed('newcontent', arguments: Subscription(
              id: subscription.id,
              provider: subscription.provider!,
              signatureDate: subscription.signatureDate,
              price: subscription.price,
              periodPayment: subscription.periodPayment,
              screens: subscription.screens,
              maxResolution: subscription.maxResolution,
              content: subscription.content,
              time: subscription.time,
              status: subscription.status
            ));
          },
          child: GridTile(
            child: Center(
              child: Image.asset(subscription.provider!.pathLogo!,
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

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

//Lista declarada apenas para carregar a página. A lista deve ser recebida da API. 
    _subscriptions = [
      Subscription(
        id: 0001,
        provider: const Provider(
          pathLogo: 'lib/assets/images/netflix.png',
          name: 'Netflix',
          category: 'cat_movies_and_series',
        ),  
        signatureDate: DateTime(2020, 11, 11),
        price: 39.90,
        periodPayment: 'monthly',
        screens: 4,
        maxResolution: 'Full HD',
        content: 0,
        time: const Duration(hours: 0, minutes: 0, seconds: 0),
        status: 1),
      Subscription(
        id: 0002,
        provider: const Provider(
          pathLogo: 'lib/assets/images/prime.png',
          name: 'Amazon Prime Video',
          category: 'cat_movies_and_series',
        ),
        signatureDate: DateTime(2018, 05, 15),
        price: 89.90,
        periodPayment: 'yearly',
        screens: 2,
        maxResolution: 'Full HD',
        content: 0,
        time: const Duration(hours: 0, minutes: 0, seconds: 0),
        status: 1),
      Subscription(
        id: 0003,
        provider: const Provider(
          pathLogo: 'lib/assets/images/hbo.png',
          name: 'HBO Max',
          category: 'cat_movies_and_series',
        ),
        signatureDate: DateTime(2021, 09, 01),
        price: 23.50,
        periodPayment: 'monthly',
        screens: 4,
        maxResolution: '4K',
        content: 0,
        time: const Duration(hours: 0, minutes: 0, seconds: 0),
        status: 1),
      Subscription(
        id: 0004,
        provider: const Provider(
          pathLogo: 'lib/assets/images/spotify.png',
          name: 'Spotify',
          category: 'cat_songs',
        ),
        signatureDate: DateTime(2019, 08, 01),
        price: 9.90,
        periodPayment: 'monthly',
        screens: 0,
        maxResolution: 'other',
        content: 0,
        time: const Duration(hours: 0, minutes: 0, seconds: 0),
        status: 1),
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('select_subscription'.i18n(), 
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
          _message,
          _grid,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add,
          size: 40,
          color: AppColors.textLight),
        backgroundColor: AppColors.primary,
        onPressed: () {
          Modular.to.pushNamed('newsubscription');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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