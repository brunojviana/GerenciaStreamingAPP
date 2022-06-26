import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:frontend/src/features/auth/domain/repository/register_interface.dart';
import '../dto/user_register_dto.dart';

class RegisterRepository implements IRegister {
  @override
  Future<int?> register(UserRegisterDto userRegister) async {
    final res;
    try {
      if (userRegister.path_image != null) {
        res = await http.post(
          Uri.http('192.168.0.136:3000', '/users'), 
          body: {
          "name": userRegister.name,
          "email": userRegister.email,
          "cpf": userRegister.cpf,
          "date_birth": userRegister.dateBirth,
          "password": userRegister.password,
          "path_image": userRegister.path_image
          }
        );  
      } else {
        res = await http.post(
          Uri.http('192.168.0.137:3000', '/users'), 
          body: {
          "name": userRegister.name,
          "email": userRegister.email,
          "cpf": userRegister.cpf,
          "date_birth": userRegister.dateBirth,
          "password": userRegister.password
          }
        );
      }
      return res.statusCode;
    } on Error catch (e) {
      print(e);
      return null;
    }
  }
}