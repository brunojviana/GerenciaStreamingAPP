import 'dart:convert';
import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/src/features/auth/domain/repository/login_interface.dart';
import '../../domain/model/profile.dart';

class LoginRepository implements ILogin {
  @override
  Future<Profile?> login(UserDto user) async {
    late Profile _profile;

    try {
      final res = await http.post(
        Uri.http('192.168.0.12:3000', '/login'),
        body: {
          "email": user.usermail,
          "password": user.password
        }
      );
      _profile = jsonDecode(res.body);
      return _profile;
    } on Error catch (e) {
      print(e);
      return null;
    }
  }
}