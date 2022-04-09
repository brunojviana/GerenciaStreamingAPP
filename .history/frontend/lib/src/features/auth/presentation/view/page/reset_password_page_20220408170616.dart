import 'package:flutter/material.dart';
import 'package:frontend/src/common/fom_text_field.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../../viewmodel/reset_password_viewmodel.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({ Key? key }) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ModularState<ResetPasswordPage, ResetPasswordViewModel> {
  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 11, 3, 124),
        title: Text('Recuperar Senha'),
      ),
      
      
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Container(
                alignment: Alignment.topLeft,
                child: Text('Informe seus dados'),
              ),

              SizedBox(height: 25),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 25),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                labelText: 'Data de Nascimento',
                border: OutlineInputBorder(),
                ), 
              ),
              
              SizedBox(height: 80),

              ElevatedButton(
                onPressed: _enviar,
                child: Text(
                  'ENVIAR',
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );  
  }
}