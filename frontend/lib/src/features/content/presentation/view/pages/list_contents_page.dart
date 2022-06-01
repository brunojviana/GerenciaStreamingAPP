import 'package:flutter/material.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../viewmodel/list_contents_viewmodel.dart';
//import '../../../../subscription/domain/model/provider.dart';
//import '../../../domain/model/content.dart';

//Classe declarada apenas para carregar a tela. Deve ser utilizada a model.
class Content {
  int id;
  Provider provider;
  String name;
  String category;
  DateTime startDate;
  DateTime lastAccess;
  Duration time;
  int status;

  Content(
    {required this.id,
     required this.provider,
     required this.name,
     required this.category,
     required this.startDate,
     required this.lastAccess,
     required this.time,
     required this.status
    });
}

class Provider {
  String pathLogo;
  String name;

  Provider(
    {
      required this.pathLogo,
      required this.name,
    });
}

class ListContentsPage extends StatefulWidget {
  const ListContentsPage({Key? key}) : super(key: key);

  @override
  State<ListContentsPage> createState() => _ListContentsPageState();
}

class _ListContentsPageState extends ModularState<ListContentsPage, ListContentsViewModel> {
  late ThemeData _theme;
  late List<Content> _contents;

  Widget get _dataContent => SizedBox(
    height: double.infinity,
    width: double.infinity,
    child: ListView.builder(
      itemCount: _contents.length,
      itemBuilder: (context, index) {
        final content = _contents[index];
        
        return Card(
          child: ListTile(
            onTap: () {
              Modular.to.pushNamed('detailcontent', arguments: Content(
                id: _contents[index].id,
                provider: _contents[index].provider,
                name: _contents[index].name,
                category: _contents[index].category,
                startDate: _contents[index].startDate,
                lastAccess: _contents[index].lastAccess,
                time: _contents[index].time,
                status: _contents[index].status));
            },
            title: Text(content.name,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.text, 
              ),
            ),
            subtitle: Text(content.category.i18n() + '\n' +
                           content.provider.name + '\n' +
                           'last_access'.i18n() + ': ' + 
                           content.lastAccess.day.toString() + '/' +
                           content.lastAccess.month.toString() + '/' +
                           content.lastAccess.year.toString(),
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text, 
                ),
              ),
            leading: Image.asset(content.provider.pathLogo,
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
    _contents = [
      Content(
        id: 0001,
        provider: Provider(
          pathLogo: 'lib/assets/images/netflix.png',
          name: 'Netflix'),
        name: 'Onde os Fracos Não tem Vez',
        category: 'cat_movies',
        startDate: DateTime(2022, 05, 11),
        lastAccess: DateTime(2022, 05, 11, 22, 30),
        time: const Duration(minutes: 120),
        status: 0),
      Content(
        id: 0002,
        provider: Provider(
          pathLogo: 'lib/assets/images/hbo.png',
          name: 'HBO Max'),
        name: 'Band of Brothers',
        category: 'cat_series',
        startDate: DateTime(2022, 03, 05),
        lastAccess: DateTime(2022, 05, 15, 0, 47),
        time: const Duration(hours: 8, minutes: 35),
        status: 1),
      Content(
        id: 0003,
        provider: Provider(
          pathLogo: 'lib/assets/images/prime.png',
          name: 'Amazon Prime Video'),
        name: 'The Boys',
        category: 'cat_series',
        startDate: DateTime(2021, 01, 28),
        lastAccess: DateTime(2021, 02, 17, 23, 45),
        time: const Duration(hours: 15, minutes: 18),
        status: 0),
      Content(
        id: 0004,
        provider: Provider(
          pathLogo: 'lib/assets/images/starplus.png',
          name: 'Star +'),
        name: 'O Oitavo Passageiro',
        category: 'cat_movies',
        startDate: DateTime(2022, 03, 07),
        lastAccess: DateTime(2022, 03, 07, 23, 15),
        time: const Duration(minutes: 140),
        status: 0),
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('my_movies'.i18n(), 
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight, 
            ),
          ),
        ),
      body: _dataContent, 
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add,
          size: 40,
          color: AppColors.textLight),
        backgroundColor: AppColors.primary,
        onPressed: () {
          Modular.to.pushNamed('selectsubscription');
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