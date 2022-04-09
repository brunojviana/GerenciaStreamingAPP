import 'dart:html';

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  void _cadastrar(){

  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 11, 3, 124),
        title: Text('Cadastro'),
      ),    

       body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Text('Informe seus dados'),
              
              SizedBox(height: 25),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 12),

              TextFormField(
                decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
                ), 
              ),
              
              SizedBox(height: 12),

               TextFormField(
                decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                ), 
              ),

              SizedBox(height: 12),

               TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                labelText: 'Data de Nascimento',
                border: OutlineInputBorder(),
                ), 
              ),
              
              SizedBox(height: 30),

              Text('Crie sua senha'),

              SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                labelText: 'Insira sua senha',
                border: OutlineInputBorder(),
                ), 
              ),
                       
              SizedBox(height: 10),

              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text('A senha deve conter 8 caracteres'),
                    Text('Deve possuir letras e números '),
                    Text('Pelo menos um caracter especial'),

                     SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: _cadastrar,
                      child: Text(
                        'CADASTRAR',
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
            ],
          ),
        ),  
      ),
    );
  }
}