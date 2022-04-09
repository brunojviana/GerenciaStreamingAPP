import 'package:flutter/material.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends ModularState<LoginPage, LoginViewModel> {

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
        backgroundColor: AppColors.primary,
        title: Column(
          children: <Widget>[
            Text('Meu Streaming', 
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 90, 81, 81), 
              ),
            ),
            SizedBox(height: 5),
            Text('Gerencie suas assinaturas de serviço de Streaming e acompanhe seu consumo ',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textLight, 
              ),
            ),
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
              
              Text('Insira seu Usuário e Senha',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondary, 
                ),
              ),
              
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
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondary, 
                      ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: _esqueciSenha,
                ),
              ),

              SizedBox(height: 40),

              ElevatedButton(
                onPressed: _entrar,
                child: Text(
                  'ENTRAR',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textLight, 
                  ),
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
                height: 48,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    TextButton(
                      child: Text(
                      'Não possui conta? Cadastre-se',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textLight, 
                      ),
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