import 'package:flutter/material.dart';
import 'package:frontend/src/features/auth/domain/model/profile.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/colored_print/print_color.dart';
import 'package:localization/localization.dart';
import '../../../../subscription/domain/model/subscription.dart';
import '../../viewmodel/list_contents_viewmodel.dart';
import '../../../../subscription/domain/model/provider.dart';
import '../../../domain/model/content.dart';

class ListContentsPage extends StatefulWidget {
  final List<Content> contents;
  final String idSub;
  const ListContentsPage({Key? key, required this.contents, required this.idSub}) : super(key: key);

  @override
  State<ListContentsPage> createState() => _ListContentsPageState();
}

class _ListContentsPageState extends ModularState<ListContentsPage, ListContentsViewModel> {
  late ThemeData _theme;
  late List<Content> _contents;
  late Profile _profile;
  late Subscription _sub;
  late DateTime data;

  Widget get _dataContent => SizedBox(
    height: double.infinity,
    width: double.infinity,
    child: ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: widget.contents.length,
      itemBuilder: (context, index) {
        final Content content = widget.contents[index];
        data = DateTime.parse(content.lastAccess);
        
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.pop(context);
              Modular.to.pushNamed("detailcontent/${int.parse(widget.idSub)}", arguments: content);
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
              content.subscription!.provider!.name! + '\n' +
              'last_access'.i18n() + ': ' + 
              data.day.toString() + '/' +
              data.month.toString() + '/' +
              data.year.toString() + '\n' +
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
            leading: Image.asset(content.subscription!.provider!.path_image,
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
    List<Content> _contents = await store.loadContents(userId);
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
        onPressed: () async {
          _profile = await store.getSavedUser();
          print('aqui');
          print(widget.idSub);
          _sub = await store.loadSubscription(int.parse(widget.idSub));
          print(_sub);
          print('agora');
          Navigator.pop(context);
          Modular.to.pushNamed('newcontent', arguments: _sub);
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
                  _profile = await store.getSavedUser();
                  Modular.to.pushNamed('/home', arguments: _profile);
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