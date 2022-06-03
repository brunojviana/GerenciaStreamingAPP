import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import '../model/user.dart';

abstract class IPassword {
  Future<User> setNewPassword(UserDto user);
}