import 'package:flutter/material.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../../domain/model/content.dart';
import '../../viewmodel/content_detail_viewmodel.dart';

class ContentDetailPage extends StatefulWidget {
  final Content content;
  const ContentDetailPage({Key? key, required this.content}) : super(key: key);

  @override
  State<ContentDetailPage> createState() => _ContentDetailPageState();
}

class _ContentDetailPageState extends ModularState<ContentDetailPage, ContentDetailViewModel> {
  late ThemeData _theme;
  late Profile _profile;

  Widget get _provider => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 100,
    child: Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Image.asset(widget.content.provider!.path_image!,
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
              Text(widget.content.name!,
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text, 
                ),
                textAlign: TextAlign.left,
              ),
              Text('category'.i18n() + ': ' + widget.content.category!.i18n() + '\n' +
                       'provider'.i18n() + ': ' + widget.content.provider!.name!,
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 18,
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
      child: Row(
        children: [
          const Icon(Icons.calendar_month, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('start_date'.i18n() + ': ' +
                      widget.content.startDate!.day.toString() + '/' +
                      widget.content.startDate!.month.toString() + '/' +
                      widget.content.startDate!.year.toString(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ); 

  Widget get _startTime => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.access_time, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('start_time'.i18n() + ': ' +
                      widget.content.startDate!.hour.toString() + ':' +
                      widget.content.startDate!.minute.toString(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ); 

  Widget get _lastAccessDate => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.calendar_month, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('last_access_date'.i18n() + ': ' +
                      widget.content.lastAccess!.day.toString() + '/' +
                      widget.content.lastAccess!.month.toString() + '/' +
                      widget.content.lastAccess!.year.toString(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );

  Widget get _lastAccessTime => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.access_time, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('last_access_time'.i18n() + ': ' + 
                      widget.content.lastAccess!.hour.toString() + ':' +
                      widget.content.lastAccess!.minute.toString(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );

  Widget get _entertainmentTime => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.timelapse, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('entertainment_time'.i18n() + ': ' +
                      widget.content.time!.inHours.toString() + 'hours'.i18n(),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );

  Widget get _status => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 25,
    width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.offline_pin, color: AppColors.accent),
          const SizedBox(width: 10),
          Text('status'.i18n() + ': ' + _verifyStatus(widget.content.status!),
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.text, 
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );

  Widget get _editButton => Column(
    children: [
      IconButton(
        iconSize: 30,
        onPressed: () {
          Modular.to.pushNamed('editcontent', arguments: widget.content);
        },
        icon: const Icon(Icons.edit),
      ),
      Text('edit'.i18n()),
    ],
  );

Widget get _pauseButton => Column(
    children: [
      IconButton(
        iconSize: 30,
        onPressed: () {
          if (widget.content.status == 0){
            store.switchStatus(1);  
          }
        },
        icon: const Icon(Icons.pause_circle, color: Colors.red),
      ),
      Text('pause'.i18n()),
    ],
  );

  Widget get _concludeButton => Column(
    children: [
      IconButton(
        iconSize: 30,
        onPressed: () {
          if (widget.content.status == 1){
            store.switchStatus(0);  
          }
        },
        icon: const Icon(Icons.done, color: AppColors.accent),
      ),
      Text('conclude'.i18n()),
    ],
  );

  Widget get _deleteButton => Column(
    children: [
      IconButton(
        iconSize: 30,
        onPressed: () { 
          store.deleteContent(widget.content.id!);
        },
        icon: const Icon(Icons.delete),
      ),
      Text('delete'.i18n()),
    ],
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
        centerTitle: true,
        ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(child: _provider),
              Card(child: _startDate),
              Card(child: _startTime),
              Card(child: _lastAccessDate),
              Card(child: _lastAccessTime),
              Card(child: _entertainmentTime),
              Card(child: _status),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        _editButton,
        _pauseButton,
        _concludeButton,
        _deleteButton
      ],
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