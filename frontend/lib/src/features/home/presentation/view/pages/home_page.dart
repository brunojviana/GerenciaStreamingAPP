import 'package:flutter/material.dart';
import 'package:frontend/src/features/auth/domain/model/profile.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
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
        onTap: () {
          Modular.to.pushNamed('recommendations', arguments: widget.profile);
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