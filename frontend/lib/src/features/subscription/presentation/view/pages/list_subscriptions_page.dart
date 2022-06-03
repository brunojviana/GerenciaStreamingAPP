import 'package:flutter/material.dart';
import 'package:frontend/src/features/subscription/domain/model/subscription.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../domain/model/provider.dart';
import '../../viewmodel/list_subscriptions_viewmodel.dart';

class ListSubscriptionsPage extends StatefulWidget {
  const ListSubscriptionsPage({Key? key}) : super(key: key);

  @override
  State<ListSubscriptionsPage> createState() => _ListSubscriptionsPageState();
}

class _ListSubscriptionsPageState extends ModularState<ListSubscriptionsPage, ListSubscriptionsViewModel> {
  late ThemeData _theme;
  late List<Subscription> _subscriptions;

  Widget get _dataSubscription => SizedBox(
    height: double.infinity,
    width: double.infinity,
    child: ListView.builder(
      itemCount: _subscriptions.length,
      itemBuilder: (context, index) {
        final subscription = _subscriptions[index];
        
        return Card(
          child: ListTile(
            onTap: () {
              Modular.to.pushNamed('detailsubscription', arguments: Subscription(
                id: _subscriptions[index].id,
                provider: _subscriptions[index].provider,
                signatureDate: _subscriptions[index].signatureDate,
                price: _subscriptions[index].price,
                periodPayment: _subscriptions[index].periodPayment,
                screens: _subscriptions[index].screens,
                maxResolution: _subscriptions[index].maxResolution,
                content: _subscriptions[index].content,
                time: _subscriptions[index].time,
                status: _subscriptions[index].status));
            },
            title: Text(subscription.provider!.name!,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.text, 
              ),
            ),
            subtitle: Text(subscription.provider!.category!.i18n() + '\n' +
                           'signature_date'.i18n() + ': ' + 
                           subscription.signatureDate!.day.toString() + '/' +
                           subscription.signatureDate!.month.toString() + '/' +
                           subscription.signatureDate!.year.toString() + '\n' +
                           'price'.i18n() + ': ' + 'currency'.i18n() +
                           subscription.price.toString(),
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text, 
                ),
              ),
            leading: Image.asset(subscription.provider!.pathLogo!,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    )
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
        title: Text('my_subscriptions'.i18n(), 
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight, 
            ),
          ),
        ),
      body: _dataSubscription, 
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add,
          size: 40,
          color: AppColors.textLight),
        backgroundColor: AppColors.primary,
        onPressed: () {
          Modular.to.pushNamed('selectprovider');
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