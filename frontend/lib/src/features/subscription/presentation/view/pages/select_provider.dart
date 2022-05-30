import 'package:flutter/material.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
//import '../../../domain/model/provider.dart';
import '../../viewmodel/select_provider_viewmodel.dart';

//Classe declarada apenas para carregar a tela. Deve ser utilizado o model.
class Provider {
  String pathLogo;

  Provider(
    {required this.pathLogo});
}

class SelectProviderPage extends StatefulWidget {
  const SelectProviderPage({Key? key}) : super(key: key);

  @override
  State<SelectProviderPage> createState() => _SelectProviderPageState();
}

class _SelectProviderPageState extends ModularState<SelectProviderPage, SelectProviderViewModel> {
  late ThemeData _theme;
  late List<Provider> _providers;

  Widget get _message => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
          Modular.to.pushNamed('newsubscription');
        },
        child: GridTile(
          child: Center(
            child: Image.asset(provider.pathLogo,
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
      Provider(pathLogo: 'lib/assets/images/apple.png'),
      Provider(pathLogo: 'lib/assets/images/apple music.png'),
      Provider(pathLogo: 'lib/assets/images/comebol.png'),
      Provider(pathLogo: 'lib/assets/images/crunchroll.png'),
      Provider(pathLogo: 'lib/assets/images/dazn.png'),
      Provider(pathLogo: 'lib/assets/images/deezer.png'),
      Provider(pathLogo: 'lib/assets/images/disney.png'),
      Provider(pathLogo: 'lib/assets/images/globo.png'),
      Provider(pathLogo: 'lib/assets/images/hbo.png'),
      Provider(pathLogo: 'lib/assets/images/nba.png'),
      Provider(pathLogo: 'lib/assets/images/paramount.png'),
      Provider(pathLogo: 'lib/assets/images/premiere.png'),
      Provider(pathLogo: 'lib/assets/images/prime music.png'),
      Provider(pathLogo: 'lib/assets/images/prime.png'),
      Provider(pathLogo: 'lib/assets/images/spotify.png'),
      Provider(pathLogo: 'lib/assets/images/starz.png'),
      Provider(pathLogo: 'lib/assets/images/tidal.png')
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
        ),
      body: Column(
        children: [
          _message,
          _grid,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: AppColors.primaryLight,
        onPressed: () {
          Modular.to.pushNamed('newprovider');
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