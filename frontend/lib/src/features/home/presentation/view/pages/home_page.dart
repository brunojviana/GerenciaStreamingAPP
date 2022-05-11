import 'package:flutter/material.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../viewmodel/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeViewModel> {
  late ThemeData _theme;
  late String _name;

  Widget get _myData => Column(
    children: [
      SizedBox(
        height: 20,
        width: 104,
        child: Text('my_data'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),
      GestureDetector(
        onTap: () {
          Modular.to.pushNamed('/profile');
        },
        child: SizedBox(
          height: 104,
          width: 104,
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
        height: 20,
        width: 104,
        child: Text('my_subscritptions'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),      
      GestureDetector(
        onTap: () {
          Modular.to.pushNamed('/subscriptions');
        },
        child: SizedBox(
          height: 104,
          width: 104,
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
        height: 20,
        width: 104,
        child: Text('my_movies'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),      
      GestureDetector(
        onTap: () {
          Modular.to.pushNamed('/movies');
        },
        child: SizedBox(
          height: 104,
          width: 104,
          child: Image.asset('lib/assets/images/aplicativo-de-streaming-de-tv.png',
            width: 104,
            height: 104,
            fit: BoxFit.scaleDown,
            ),
          ),
        ),
    ],
  );

  Widget get _myOtherContents => Column(
    children: [
      SizedBox(
        height: 20,
        width: 104,
        child: Text('my_other_contents'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),
      GestureDetector(
        onTap: () {
          Modular.to.pushNamed('/otherContents');
        },
        child: SizedBox(
          height: 104,
          width: 104,
          child: Image.asset('lib/assets/images/musica.png',
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
        height: 20,
        width: 104,
        child: Text('my_spending_history'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),
      GestureDetector(
        onTap: () {
          Modular.to.pushNamed('/spendings');
        },
        child: SizedBox(
          height: 104,
          width: 104,
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
        height: 20,
        width: 104,
        child: Text('recommendations'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),
      GestureDetector(
        onTap: () {
          Modular.to.pushNamed('/recommendations');
        },
        child: SizedBox(
          height: 104,
          width: 104,
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
        height: 20,
        width: 104,
        child: Text('map'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),
      GestureDetector(
        onTap: () {
          Modular.to.pushNamed('/map');
        },
        child: SizedBox(
          height: 104,
          width: 104,
          child: Image.asset('lib/assets/images/mapa.png',
            width: 104,
            height: 104,
            fit: BoxFit.scaleDown,
            ),
          ),
        ),
    ],
  );

  Widget get _notifications => Column(
    children: [
      SizedBox(
        height: 20,
        width: 104,
        child: Text('notifications'.i18n(),
            style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text, 
            ),
            textAlign: TextAlign.center,
          ),
        ),
      GestureDetector(
        onTap: () {
          Modular.to.pushNamed('/notifications');
        },
        child: SizedBox(
          height: 104,
          width: 104,
          child: Image.asset('lib/assets/images/notificacao.png',
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

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('welcome'.i18n() + _name, 
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight, 
            ),
          ),
        ),
      body: Center(
        child: SingleChildScrollView(
          child: Observer(builder: (_) {
            return Form(
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      _myData,
                      _mySubscriptions,
                    ],
                  ),
                  Row(
                    children: [
                      _myMovies,
                      _myOtherContents,
                    ],
                  ),
                  Row(
                    children: [
                      _mySpendings,
                      _recommendations,
                    ],
                  ),
                  Row(
                    children: [
                      _map,
                      _notifications,
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
          height: 47.0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Positioned(
              bottom: 20,
              child: IconButton(
                icon: const Icon(Icons.home, color: AppColors.textLight),
                onPressed: () {
                  Modular.to.pushNamed('/login');
                }
              ),  
            )
          ),
        ),
      ),
    );
  }
}