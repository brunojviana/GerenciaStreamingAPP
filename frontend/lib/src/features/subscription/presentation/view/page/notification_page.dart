import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:frontend/src/features/subscription/register_subscription/presentation/viewmodel/register_subscription_viewmodel.dart';
import 'package:frontend/src/features/auth/presentation/viewmodel/new_password_viewmodel.dart';

class Notification extends StatefulWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends ModularState<Notification, RegisterSubscriptionViewModel> { //Alterar Notification
  
  late ThemeData _theme;

  bool _notif_disable = false;
  bool _notif_time = false;
  bool _notif_price = false;
  bool _notif_service = false;

   Widget get _switch_disable => Container(
    margin: const EdgeInsets.fromLTRB(15, 60, 15, 10),
    child: SwitchListTile(
      title: Text('notif_disable'.i18n(), 
        style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
        )
      ),
      activeColor:AppColors.accent,
      value: _notif_disable,
      onChanged: (bool value){
        setState(() {
          _notif_disable = value;
        });
      },
    ),
  );

  Widget get _switch_time => Container(
    margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
    child: SwitchListTile(
      title: Text('notif_time'.i18n(), 
        style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
        )
      ),
      activeColor:AppColors.accent,
      value: _notif_time,
      onChanged: (bool value){
        setState(() {
          _notif_time = value;
        });
      },
    ),
  );

  Widget get _switch_price => Container(
    margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
    child: SwitchListTile(
      title: Text('notif_price'.i18n(), 
        style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
        )
      ),
      activeColor:AppColors.accent,
      value: _notif_price,
      onChanged: (bool value){
        setState(() {
          _notif_price = value;
        });
      },
    ),
  );

  Widget get _switch_service => Container(
    margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
    child: SwitchListTile(
      title: Text('notif_service'.i18n(), 
        style: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.text, 
        )
      ),
      activeColor:AppColors.accent,
      value: _notif_service,
      onChanged: (bool value){
        setState(() {
          _notif_service = value;
        });
      },
    ),
  );


  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

  return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('notifications'.i18n(),  
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,         
            children: <Widget>[
              _switch_disable,
              _switch_time,
              _switch_price,
              _switch_service
            ]
          )
        ]
      ),
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