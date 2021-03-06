import 'package:flutter/material.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import '../../../../auth/domain/model/profile.dart';
import '../../../domain/model/content.dart';
import '../../viewmodel/content_detail_viewmodel.dart';

class ContentDetailPage extends StatefulWidget {
  final Content content;
  final String idSub;
  const ContentDetailPage({Key? key, required this.content, required this.idSub}) : super(key: key);

  @override
  State<ContentDetailPage> createState() => _ContentDetailPageState();
}

class _ContentDetailPageState extends ModularState<ContentDetailPage, ContentDetailViewModel> {
  late ThemeData _theme;
  late Profile _profile;
  late DateTime lastDate;
  late DateTime startDate;
  late List<Content> _contents;

  Widget get _provider => Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 100,
    child: Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Image.asset(widget.content.subscription!.provider!.path_image,
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
                       'provider'.i18n() + ': ' + widget.content.subscription!.provider!.name!,
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
                      startDate.day.toString() + '/' +
                      startDate.month.toString() + '/' +
                      startDate.year.toString(),
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
                      startDate.hour.toString() + ':' +
                      startDate.minute.toString(),
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
                      lastDate.day.toString() + '/' +
                      lastDate.month.toString() + '/' +
                      lastDate.year.toString(),
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
                      lastDate.hour.toString() + ':' +
                      lastDate.minute.toString(),
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
                      widget.content.time.toString() + 'hours'.i18n(),
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
          Navigator.pop(context);
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
        onPressed: () async {
          if (widget.content.status == 0){
            Content res = await store.switchStatus(1, widget.content);
            setState(() {
              widget.content.status = res.status;
              widget.content.time = res.time;
            });
            _showDialog(0);
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
        onPressed: () async {
          if (widget.content.status == 1){
            Content res = await store.switchStatus(0, widget.content);
            print(res.time);
            setState(() {
              widget.content.status = res.status;
              print(res.time);
              widget.content.time = res.time;
            });
            _showDialog(1); 
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
        onPressed: () async { 
          int res = await store.deleteContent(widget.content.id!);
          _contents = await store.loadContents(int.parse(widget.idSub));
          Navigator.pop(context);
          Modular.to.pushNamed("listcontents/${int.parse(widget.idSub)}", arguments: _contents);
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

  Future<void> _showDialog(int res) async {
    //Subscription? subscription = widget.subscription;

    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: (res == 1) ? 
            const Icon(Icons.done, size: 40, color: Colors.green) :
            const Icon(Icons.pause, size: 40, color: Colors.red),
          content: (res == 1) ?
            Text('content_concluded_success'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.text, 
              ),
              textAlign: TextAlign.center,
            ) :
            Text('content_pause'.i18n(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          actions: <Widget>[TextButton(
            child: Text('ok'.i18n().toString()),
              onPressed: () async {
                _contents = await store.loadContents(int.parse(widget.idSub));
                Navigator.pop(context);
                //Modular.to.pushNamed("listcontents/${widget.idSub}", arguments: _contents);
              },  
            ),
          ]
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    lastDate = DateTime.parse(widget.content.lastAccess).toLocal();
    startDate = DateTime.parse(widget.content.startDate).toLocal();

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
        (_verifyStatus(widget.content.status!) == 'Concluded') ?
        _pauseButton :
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