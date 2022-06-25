import 'package:flutter/material.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../../domain/model/provider.dart';
import '../../viewmodel/select_provider_viewmodel.dart';

class SelectProviderPage extends StatefulWidget {
  final List<Provider> providers;
  const SelectProviderPage({Key? key, required this.providers}) : super(key: key);

  @override
  State<SelectProviderPage> createState() => _SelectProviderPageState();
}

class _SelectProviderPageState extends ModularState<SelectProviderPage, SelectProviderViewModel> {
  late ThemeData _theme;

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
    itemCount: widget.providers.length,
    itemBuilder: (context,index) {
      final provider = widget.providers[index];
              
      return GestureDetector(
        onTap: () {
          Modular.to.pushNamed('newsubscription', arguments: widget.providers[index]);
        },
        child: GridTile(
          child: Center(
            child: Image.asset(provider.path_image ?? 'lib/assets/images/perfil.png',
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
    
    /* //Lista declarada apenas para carregar a tela. Deve ser carregada da API.
    widget.providers = [
      const Provider(
        id: 1,
        path_image: 'lib/assets/images/apple.png',
        name: 'Apple TV',
        category: 'cat_movies_and_series'),
      const Provider(
        id: 2,
        path_image: 'lib/assets/images/apple music.png',
        name: 'Apple Music',
        category: 'cat_songs'),
      const Provider(
        id: 3,
        path_image: 'lib/assets/images/comebol.png',
        name: 'Commebol TV',
        category: 'cat_sports'),
      const Provider(
        id: 4,
        path_image: 'lib/assets/images/crunchroll.png',
        name:  'Crunchroll',
        category: 'cat_anime'),
      const Provider(
        id: 5,
        path_image: 'lib/assets/images/dazn.png',
        name: "DAZN",
        category: 'cat_sports'),
      const Provider(
        id: 6,
        path_image: 'lib/assets/images/deezer.png',
        name: 'Deezer',
        category: 'cat_songs'),
      const Provider(
        id: 7,
        path_image: 'lib/assets/images/disney.png',
        name: 'Disney +',
        category: 'cat_movies_and_series'),
      const Provider(
        id: 8,
        path_image: 'lib/assets/images/globo.png',
        name: 'GloboPlay',
        category: 'cat_movies_and_series'),
      const Provider(
        id: 9,
        path_image: 'lib/assets/images/hbo.png',
        name: 'HBO Max',
        category: 'cat_movies_and_series'),
      const Provider(
        id: 10,
        path_image: 'lib/assets/images/nba.png',
        name: 'NBA League Pass',
        category: 'cat_sports'),
      const Provider(
        id: 11,
        path_image: 'lib/assets/images/paramount.png',
        name: 'Paramount +',
        category: 'cat_movies_and_series'),
      const Provider(
        id: 12,
        path_image: 'lib/assets/images/premiere.png',
        name: 'Premiere',
        category: 'cat_sports'),
      const Provider(
        id: 13,
        path_image: 'lib/assets/images/prime music.png',
        name: 'Amazon Prime Music',
        category: 'cat_songs'),
      const Provider(
        id: 14,
        path_image: 'lib/assets/images/prime.png',
        name: 'Amazon Prime Video',
        category: 'cat_movies_and_series'),
      const Provider(
        id: 15,
        path_image: 'lib/assets/images/spotify.png',
        name: 'Spotify',
        category: 'cat_songs'),
      const Provider(
        id: 15,
        path_image: 'lib/assets/images/starz.png',
        name: 'Starz Play',
        category: 'cat_movies_and_series'),
      const Provider(
        id: 16,
        path_image: 'lib/assets/images/tidal.png',
        name: 'Tidal',
        category: 'cat_songs'),
      const Provider(
        id: 17,
        path_image: 'lib/assets/images/starplus.png',
        name: 'Star +',
        category: 'cat_sports')
    ]; */

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
          Modular.to.pushNamed('newprovider');
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
                  Modular.to.pushNamed('/home');
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