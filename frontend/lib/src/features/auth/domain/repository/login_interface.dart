import 'package:frontend/src/features/auth/data/dto/user_dto.dart';

abstract class ILogin {
  Future<int?> login(UserDto user);
}