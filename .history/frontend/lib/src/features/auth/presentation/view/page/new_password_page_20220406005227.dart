import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({ Key? key }) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  void _enviar(){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 11, 3, 124),
        title: Text('Cadastrar Nova Senha'),
      ),

      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              SizedBox(height: 35),
              
              Text('Informe o código enviado para o seu e-mail'),
              
              SizedBox(height: 15),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Código',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 40),

              Text('Insira sua nova senha'),
              
              SizedBox(height: 15),
              
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                labelText: 'Nova senha',
                border: OutlineInputBorder(),
                ), 
              ),

              SizedBox(height: 12),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                labelText: 'Confirme a senha',
                border: OutlineInputBorder(),
                ), 
              ),
              
              SizedBox(height: 80),

              Container(
                height: 40,
                alignment: Alignment.center,
                child: ElevatedButton(
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
              ),      
            ],
          ),
        ),
      ),
    );
  }
}