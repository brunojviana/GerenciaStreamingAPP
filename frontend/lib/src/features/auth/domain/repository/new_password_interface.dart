import 'package:frontend/src/features/auth/data/dto/user_dto.dart';

abstract class IPassword {
  Future<int?> setNewPassword(UserDto user);
}