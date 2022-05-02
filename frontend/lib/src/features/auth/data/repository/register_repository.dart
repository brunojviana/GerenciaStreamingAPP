import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:frontend/src/features/auth/domain/repository/register_interface.dart';
import '../../domain/model/user_register.dart';


class RegisterRepository implements IRegister {
  @override
  Future<int?> register(UserRegister userRegister) async {
    try {
      final res = await http.post(
        Uri.http('192.168.0.12:3000', '/users'), 
        body: {
        "name": userRegister.name,
        "email": userRegister.email,
        "cpf": userRegister.cpf,
        "dateBirth": userRegister.dateBirth,
        "password": userRegister.password
        }
      );

      print(res.statusCode);
      
      return res.statusCode;
    } on Error catch (e) {
      print(e);
    }
    return 0;
  }
}