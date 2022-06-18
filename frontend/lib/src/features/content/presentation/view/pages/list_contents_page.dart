import 'package:flutter/material.dart';
import 'package:frontend/src/features/auth/domain/model/profile.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../viewmodel/list_contents_viewmodel.dart';
import '../../../../subscription/domain/model/provider.dart';
import '../../../domain/model/content.dart';

class ListContentsPage extends StatefulWidget {
  final Profile profile;
  final String category;
  const ListContentsPage({Key? key, required this.profile, required this.category}) : super(key: key);

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
      padding: const EdgeInsets.all(10),
      itemCount: _contents.length,
      itemBuilder: (context, index) {
        final content = _contents[index];
        
        return Card(
          child: ListTile(
            onTap: () {
              Modular.to.pushNamed('detailcontent', arguments: _contents[index]);
            },
            title: Text(content.name!,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.text, 
              ),
            ),
            subtitle: Text(content.category!.i18n() + '\n' +
              content.provider!.name! + '\n' +
              'last_access'.i18n() + ': ' + 
              content.lastAccess!.day.toString() + '/' +
              content.lastAccess!.month.toString() + '/' +
              content.lastAccess!.year.toString() + '\n' +
              'status'.i18n() + ': ' +
              _verifyStatus(content.status!),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.text, 
              ),
            ),
            minLeadingWidth: 80,
            leading: Image.asset(content.provider!.pathLogo!,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    )
  );

  Future<List<Content>> _loadContents(int userId, String category) async {
    List<Content> _contents = await store.loadContents(userId, category);
    return _contents;
  }

  String _verifyStatus(int status) {
    if (status == 0) {
      return 'concluded'.i18n();
    }
    else {
      return 'paused'.i18n();
    }
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    //_contents = _loadContents(widget.profile.id!, widget.category) as List<Content>;
    
    //Lista declarada apenas para carregar a página. A lista deve ser recebida da API. 
    _contents = [
      Content(
        id: 0001,
        provider: const Provider(
          pathLogo: 'lib/assets/images/netflix.png',
          name: 'Netflix',
          category: 'cat_movies_and_series',
        ),
        name: 'Onde os Fracos Não tem Vez',
        category: 'cat_movies',
        startDate: DateTime(2022, 05, 11),
        lastAccess: DateTime(2022, 05, 11, 22, 30),
        time: const Duration(minutes: 120),
        status: 0),
      Content(
        id: 0002,
        provider: const Provider(
          pathLogo: 'lib/assets/images/hbo.png',
          name: 'HBO Max',
          category: 'cat_movies_and_series',
        ),
        name: 'Band of Brothers',
        category: 'cat_series',
        startDate: DateTime(2022, 03, 05),
        lastAccess: DateTime(2022, 05, 15, 0, 47),
        time: const Duration(hours: 8, minutes: 35),
        status: 1),
      Content(
        id: 0003,
        provider: const Provider(
          pathLogo: 'lib/assets/images/prime.png',
          name: 'Amazon Prime Video',
          category: 'cat_movies_and_series',
        ),
        name: 'The Boys',
        category: 'cat_series',
        startDate: DateTime(2021, 01, 28),
        lastAccess: DateTime(2021, 02, 17, 23, 45),
        time: const Duration(hours: 15, minutes: 18),
        status: 0),
      Content(
        id: 0004,
        provider: const Provider(
          pathLogo: 'lib/assets/images/starplus.png',
          name: 'Star +',
          category: 'cat_movies_and_series',
        ),
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
        centerTitle: true,
        ),
      body: _dataContent, 
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add,
          size: 40,
          color: AppColors.textLight),
        backgroundColor: AppColors.primary,
        onPressed: () {
          Modular.to.pushNamed('selectsubscription', arguments: widget.profile);
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
                onPressed: () async {
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