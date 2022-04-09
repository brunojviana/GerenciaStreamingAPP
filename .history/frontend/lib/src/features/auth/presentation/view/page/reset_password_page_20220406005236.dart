import 'dart:html';

import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({ Key? key }) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  void _enviar(){

  }

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