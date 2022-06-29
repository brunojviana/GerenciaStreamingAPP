import 'package:flutter/material.dart';
import 'package:frontend/src/features/auth/domain/model/profile.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../subscription/domain/model/provider.dart';
import '../../../../subscription/domain/model/subscription.dart';
import '../../viewmodel/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  final Profile profile;
  const HomePage({Key? key, required this.profile}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeViewModel> {
  late ThemeData _theme;
  late List<Subscription> _response;
  late List<Subscription> _subscriptions;

  Widget get _myData => Column(
    children: [
      SizedBox(
        height: 30,
        width: 175,
        child: Text('my_data'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),
      GestureDetector(
        onTap: () {
          Modular.to.pushNamed('profile', arguments: widget.profile);
        },
        child: SizedBox(
          height: 110,
          width: 175,
          child: Image.asset('lib/assets/images/perfil.png',
            width: 104,
            height: 104,
            fit: BoxFit.scaleDown,
            ),
          ),
        ),
    ],
  );

  Widget get _mySubscriptions => Column(
    children: [
      SizedBox(
        height: 30,
        width: 175,
        child: Text('my_subscriptions'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),      
      GestureDetector(
        onTap: () async {
          _response = await store.getSubs(widget.profile.id!);
          Modular.to.pushNamed('subscriptions', arguments: _response);
        },
        child: SizedBox(
          height: 110,
          width: 175,
          child: Image.asset('lib/assets/images/streaming-online.png',
            width: 104,
            height: 104,
            fit: BoxFit.scaleDown,
            ),
          ),
        ),
    ],
  );

  Widget get _myMovies => Column(
    children: [
      SizedBox(
        height: 30,
        width: 175,
        child: Text('My Contents'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),      
      GestureDetector(
        onTap: () async {
          _response = await store.getSubs(widget.profile.id!);
          Modular.to.pushNamed('movies', arguments: _response);
        },
        child: SizedBox(
          height: 110,
          width: 175,
          child: Image.asset('lib/assets/images/aplicativo-de-streaming-de-tv.png',
            width: 104,
            height: 104,
            fit: BoxFit.scaleDown,
            ),
          ),
        ),
    ],
  );

  Widget get _mySpendings => Column(
    children: [
      SizedBox(
        height: 30,
        width: 175,
        child: Text('my_spending_history'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),
      GestureDetector(
        onTap: () {
          Modular.to.pushNamed('spendings', arguments: widget.profile);
        },
        child: SizedBox(
          height: 110,
          width: 175,
          child: Image.asset('lib/assets/images/aumentando.png',
            width: 104,
            height: 104,
            fit: BoxFit.scaleDown,
            ),
          ),
        ),
    ],
  );

  Widget get _recommendations => Column(
    children: [
      SizedBox(
        height: 30,
        width: 175,
        child: Text('recommendations'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),
      GestureDetector(
        onTap: () async {
          //_response = await store.getSubs(widget.profile.id!);
          //Modular.to.pushNamed('recommendations', arguments: _response);
          Modular.to.pushNamed('recommendations', arguments: _subscriptions);
        },
        child: SizedBox(
          height: 110,
          width: 175,
          child: Image.asset('lib/assets/images/recomendacao.png',
            width: 104,
            height: 104,
            fit: BoxFit.scaleDown,
            ),
          ),
        ),
    ],
  );

  Widget get _map => Column(
    children: [
      SizedBox(
        height: 30,
        width: 175,
        child: Text('map'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),
      GestureDetector(
        onTap: () {
          Modular.to.pushNamed('map', arguments: widget.profile);
        },
        child: SizedBox(
          height: 110,
          width: 175,
          child: Image.asset('lib/assets/images/mapa.png',
            width: 104,
            height: 104,
            fit: BoxFit.scaleDown,
            ),
          ),
        ),
    ],
  );

  Widget get _chatbot => Column(
    children: [
      SizedBox(
        height: 30,
        width: 175,
        child: Text('chatbot'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),
      GestureDetector(
        onTap: () {
          Modular.to.pushNamed('chatbot', arguments: widget.profile);
        },
        child: SizedBox(
          height: 110,
          width: 175,
          child: Image.asset('lib/assets/images/chat.png',
            width: 104,
            height: 104,
            fit: BoxFit.scaleDown,
            ),
          ),
        ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    //Lista declarada apenas para carregar a tela
    _subscriptions = [
      Subscription(
        id: 0001,
        provider: const Provider(
          id: 1,
          path_image: 'lib/assets/images/netflix.png',
          name: 'Netflix',
          category: 'cat_movies_and_series',
        ),   
        signatureDate: '11/11/2020',
        price: 39.90,
        periodPayment: 'monthly',
        screens: 4,
        maxResolution: 'Full HD',
        content: 0,
        useTime: 30,
        status: 1),
      Subscription(
        id: 0002,
        provider: const Provider(
          id: 2,
          path_image: 'lib/assets/images/prime.png',
          name: 'Amazon Prime Video',
          category: 'cat_movies_and_series',
        ),
        signatureDate: '15/05/2018',
        price: 89.90,
        periodPayment: 'yearly',
        screens: 2,
        maxResolution: 'Full HD',
        content: 0,
        useTime: 45,
        status: 1),
      Subscription(
        id: 0003,
        provider: const Provider(
          id: 3,
          path_image: 'lib/assets/images/hbo.png',
          name: 'HBO Max',
          category: 'cat_movies_and_series',
        ),
        signatureDate:'01/09/2021',
        price: 23.50,
        periodPayment: 'monthly',
        screens: 4,
        maxResolution: '4K',
        content: 0,
        useTime: 15,
        status: 1),
      Subscription(
        id: 0004,
        provider: const Provider(
          id: 4,
          path_image: 'lib/assets/images/spotify.png',
          name: 'Spotify',
          category: 'cat_songs',
        ),
        signatureDate: '01/08/2019',
        price: 9.90,
        periodPayment: 'monthly',
        screens: 0,
        maxResolution: 'other',
        content: 0,
        useTime: 20,
        status: 1),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Center(
          child: Text('welcome'.i18n() + widget.profile.name + '!', 
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textLight, 
              ),
              textAlign: TextAlign.center,
            ),
        ),
        ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(5.0),
          child: Observer(builder: (_) {
            return Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(child: _mySubscriptions),
                      Card(child: _myMovies),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(child: _mySpendings),
                      Card(child: _recommendations),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(child: _map),
                      Card(child: _chatbot),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(child: _myData),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.primary,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 45.0,
          child: IconButton(
            icon: const Icon(Icons.logout, color: AppColors.textLight),
            iconSize: 35,
            onPressed: () {
              Modular.to.pushNamed('/auth');
            }
          ),
        ),
      ),
    );
  }
}