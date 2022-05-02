import 'dart:convert';
import 'dart:developer';

import 'package:frontend/src/features/auth/domain/model/user_register.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/src/features/auth/domain/model/user.dart';
import 'package:frontend/src/features/auth/domain/repository/login_interface.dart';

class LoginRepository implements ILogin {
  @override
  Future<int?> login(User user) async {
    try {
      final res = await http.post(
        Uri.http('192.168.0.12:3000', '/login'),
        body: {
          "email": user.usermail,
          "password": user.password
        }
      );
      print(jsonDecode(res.body));
       
      return res.statusCode;
    } on Error catch (e) {
      print(e);
    }
    return null;
  }
}