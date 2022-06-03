import 'dart:convert';
import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/src/features/auth/domain/repository/login_interface.dart';

class LoginRepository implements ILogin {
  @override
  Future<int?> login(UserDto user) async {
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