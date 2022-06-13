import 'package:flutter/material.dart';
import 'package:frontend/src/features/subscription/domain/model/subscription.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../../domain/model/provider.dart';
import '../../viewmodel/select_provider_viewmodel.dart';

class SelectProviderPage extends StatefulWidget {
  final Profile profile;
  const SelectProviderPage({Key? key, required this.profile}) : super(key: key);

  @override
  State<SelectProviderPage> createState() => _SelectProviderPageState();
}

class _SelectProviderPageState extends ModularState<SelectProviderPage, SelectProviderViewModel> {
  late ThemeData _theme;
  late List<Provider> _providers;

  Widget get _message => Container(
    margin: const EdgeInsets.fromLTRB(10, 30, 10, 30),
    height: 20,
    width: double.infinity,
    child: Text('select_provider_hint'.i18n(),
      style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
      ),
      textAlign: TextAlign.center,
    ),
  );

  Widget get _grid => GridView.builder(
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5),
    padding: const EdgeInsets.all(5),
    itemCount: _providers.length,
    itemBuilder: (context,index) {
      final provider = _providers[index];
              
      return GestureDetector(
        onTap: () {
          Modular.to.pushNamed('newsubscription', arguments: _providers[index]);
        },
        child: GridTile(
          child: Center(
            child: Image.asset(provider.pathLogo!,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    
    //Lista declarada apenas para carregar a tela. Deve ser carregada da API.
    _providers = [
      const Provider(
        pathLogo: 'lib/assets/images/apple.png',
        name: 'Apple TV',
        category: 'cat_movies_and_series'),
      const Provider(
        pathLogo: 'lib/assets/images/apple music.png',
        name: 'Apple Music',
        category: 'cat_songs'),
      const Provider(
        pathLogo: 'lib/assets/images/comebol.png',
        name: 'Commebol TV',
        category: 'cat_sports'),
      const Provider(
        pathLogo: 'lib/assets/images/crunchroll.png',
        name:  'Crunchroll',
        category: 'cat_anime'),
      const Provider(
        pathLogo: 'lib/assets/images/dazn.png',
        name: "DAZN",
        category: 'cat_sports'),
      const Provider(
        pathLogo: 'lib/assets/images/deezer.png',
        name: 'Deezer',
        category: 'cat_songs'),
      const Provider(
        pathLogo: 'lib/assets/images/disney.png',
        name: 'Disney +',
        category: 'cat_movies_and_series'),
      const Provider(
        pathLogo: 'lib/assets/images/globo.png',
        name: 'GloboPlay',
        category: 'cat_movies_and_series'),
      const Provider(
        pathLogo: 'lib/assets/images/hbo.png',
        name: 'HBO Max',
        category: 'cat_movies_and_series'),
      const Provider(
        pathLogo: 'lib/assets/images/nba.png',
        name: 'NBA League Pass',
        category: 'cat_sports'),
      const Provider(
        pathLogo: 'lib/assets/images/paramount.png',
        name: 'Paramount +',
        category: 'cat_movies_and_series'),
      const Provider(
        pathLogo: 'lib/assets/images/premiere.png',
        name: 'Premiere',
        category: 'cat_sports'),
      const Provider(
        pathLogo: 'lib/assets/images/prime music.png',
        name: 'Amazon Prime Music',
        category: 'cat_songs'),
      const Provider(
        pathLogo: 'lib/assets/images/prime.png',
        name: 'Amazon Prime Video',
        category: 'cat_movies_and_series'),
      const Provider(
        pathLogo: 'lib/assets/images/spotify.png',
        name: 'Spotify',
        category: 'cat_songs'),
      const Provider(
        pathLogo: 'lib/assets/images/starz.png',
        name: 'Starz Play',
        category: 'cat_movies_and_series'),
      const Provider(
        pathLogo: 'lib/assets/images/tidal.png',
        name: 'Tidal',
        category: 'cat_songs')
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('select_provider'.i18n(), 
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
          Modular.to.pushNamed('newprovider', arguments: widget.profile);
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