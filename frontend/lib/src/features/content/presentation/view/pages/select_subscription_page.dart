import 'package:flutter/material.dart';
import 'package:frontend/src/features/subscription/domain/model/subscription.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../../../subscription/domain/model/provider.dart';
import '../../viewmodel/select_subscription_viewmodel.dart';

class SelectSubscriptionPage extends StatefulWidget {
  final Profile profile;
  const SelectSubscriptionPage({Key? key, required this.profile}) : super(key: key);

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
            Modular.to.pushNamed('newcontent', arguments: _subscriptions[index]);
          },
          child: GridTile(
            child: Center(
              child: Image.asset(subscription.provider!.path_image!,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    ),
  );

  Future<List<Subscription>> _loadSubscriptions(int userId) async {
    List<Subscription> response = await store.loadSubscriptions(userId);
    return response;
  }

  @override
  Widget build(BuildContext context)  {
    _theme = Theme.of(context);
    //_subscriptions = _loadSubscriptions(widget.profile.id!) as List<Subscription>;

//Lista declarada apenas para carregar a página. A lista deve ser recebida da API. 
    _subscriptions = [
      Subscription(
        id: 0001,
        provider: const Provider(
          path_image: 'lib/assets/images/netflix.png',
          name: 'Netflix',
          category: 'cat_movies_and_series',
        ),  
        signatureDate: DateTime(2020, 11, 11),
        price: 39.90,
        periodPayment: 'monthly',
        screens: 4,
        maxResolution: 'Full HD',
        content: 0,
        useTime: 0,
        status: 1),
      Subscription(
        id: 0002,
        provider: const Provider(
          path_image: 'lib/assets/images/prime.png',
          name: 'Amazon Prime Video',
          category: 'cat_movies_and_series',
        ),
        signatureDate: DateTime(2018, 05, 15),
        price: 89.90,
        periodPayment: 'yearly',
        screens: 2,
        maxResolution: 'Full HD',
        content: 0,
        useTime: 0,
        status: 1),
      Subscription(
        id: 0003,
        provider: const Provider(
          path_image: 'lib/assets/images/hbo.png',
          name: 'HBO Max',
          category: 'cat_movies_and_series',
        ),
        signatureDate: DateTime(2021, 09, 01),
        price: 23.50,
        periodPayment: 'monthly',
        screens: 4,
        maxResolution: '4K',
        content: 0,
        useTime: 0,
        status: 1),
      Subscription(
        id: 0004,
        provider: const Provider(
          path_image: 'lib/assets/images/spotify.png',
          name: 'Spotify',
          category: 'cat_songs',
        ),
        signatureDate: DateTime(2019, 08, 01),
        price: 9.90,
        periodPayment: 'monthly',
        screens: 0,
        maxResolution: 'other',
        content: 0,
        useTime: 0,
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
        centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _message,
            _grid,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add,
          size: 40,
          color: AppColors.textLight),
        backgroundColor: AppColors.primary,
        onPressed: () {
          Modular.to.pushNamed('newsubscription', arguments: widget.profile);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                  Modular.to.pushNamed('/home', arguments: widget.profile);
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