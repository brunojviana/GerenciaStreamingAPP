import 'dart:html';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  void _entrar(){ 

  }

  void _esqueciSenha(){

  }

  void _cadastro(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 11, 3, 124),
        title: Column(
          children: <Widget>[
            Text('Meu Streaming'),
            SizedBox(height: 5),
            Text('Gerencie suas assinaturas de serviço de Streaming e acompanhe seu consumo '),
          ],
        ),
      ),

      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              Text('Insira seu Usuário e Senha'),
              
              SizedBox(height: 40),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 25),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
                ), 
              ),
              
              Container( 
                height: 40,
                alignment: Alignment.center,
                child: TextButton(
                  child: Text(
                    'Esqueci minha Senha',
                    textAlign: TextAlign.center,
                  ),
                  onPressed: _esqueciSenha,
                ),
              ),

              SizedBox(height: 80),

              ElevatedButton(
                onPressed: _entrar,
                child: Text(
                  'ENTRAR',
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

              SizedBox(height: 40),

              Container( 
                height: 40,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    TextButton(
                      child: Text(
                      'Não possui conta? Cadastre-se',
                      textAlign: TextAlign.center,
                    ),
                    onPressed: _cadastro,
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