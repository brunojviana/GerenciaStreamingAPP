import 'package:flutter/material.dart';
import 'package:frontend/src/features/content/presentation/view/pages/list_contents_page.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
//import '../../../domain/model/content.dart';
import '../../viewmodel/content_detail_viewmodel.dart';

class ContentDetailPage extends StatefulWidget {
  final Content content;
  const ContentDetailPage({Key? key, required this.content}) : super(key: key);

  @override
  State<ContentDetailPage> createState() => _ContentDetailPageState();
}

class _ContentDetailPageState extends ModularState<ContentDetailPage, ContentDetailViewModel> {
  late ThemeData _theme;

  Widget get _provider => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 100,
    child: Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Image.asset(widget.content.provider.pathLogo,
            width: 80,
            height: 80,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          height: 75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.content.name,
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text, 
                ),
                textAlign: TextAlign.left,
              ),
              Text('category'.i18n() + ': ' + widget.content.category.i18n() + '\n' +
                       'provider'.i18n() + ': ' + widget.content.provider.name,
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text, 
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        )
      ],
    ), 
  );

  Widget get _startDate => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('start_date'.i18n() + ': ' +
                  widget.content.startDate.day.toString() + '/' +
                  widget.content.startDate.month.toString() + '/' +
                  widget.content.startDate.year.toString(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    ); 

  Widget get _startTime => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('start_time'.i18n() + ': ' +
                  widget.content.startDate.hour.toString() + ':' +
                  widget.content.startDate.minute.toString(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    ); 

  Widget get _lastAccessDate => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('last_access_date'.i18n() + ': ' +
                  widget.content.lastAccess.day.toString() + '/' +
                  widget.content.lastAccess.month.toString() + '/' +
                  widget.content.lastAccess.year.toString(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    );

  Widget get _lastAccessTime => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('last_access_time'.i18n() + ': ' + 
                  widget.content.lastAccess.hour.toString() + ':' +
                  widget.content.lastAccess.minute.toString(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    );

  Widget get _entertainmentTime => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('entertainment_time'.i18n() + ': ' +
                  widget.content.time.toString() + 'hours'.i18n(),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    );

  Widget get _status => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Text('status'.i18n() + ': ' + _verifyStatus(widget.content.status),
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.text, 
        ),
        textAlign: TextAlign.left,
      ),
    );

  Widget get _editButton => IconButton(
    iconSize: 40,
    onPressed: () {
      Modular.to.pushNamed('editcontent');
    },
    icon: const Icon(Icons.edit),
  );

  Widget get _concludeButton => IconButton(
    iconSize: 40,
    onPressed: () {
      if (widget.content.status == 0){
        store.switchStatus(1);  
      }
      else {
        store.switchStatus(0);
      } 
    },
    icon: const Icon(Icons.done),
  );

  Widget get _deleteButton => IconButton(
    iconSize: 40,
    onPressed: () { 
      store.deleteContent(widget.content.id);
    },
    icon: const Icon(Icons.delete),
  );

  String _verifyStatus(int status) {
    if (widget.content.status == 0) {
      return 'concluded'.i18n();
    }
    else {
      return 'paused'.i18n();
    }
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('content_detail'.i18n(), 
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
          _provider,
          _startDate,
          _startTime,
          _lastAccessDate,
          _lastAccessTime,
          _entertainmentTime,
          _status,
        ],
      ),
      persistentFooterButtons: [
        _editButton,
        _concludeButton,
        _deleteButton
      ],
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