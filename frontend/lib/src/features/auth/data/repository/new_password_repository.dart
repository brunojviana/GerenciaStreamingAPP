import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import 'package:frontend/src/features/auth/domain/model/user.dart';
import 'package:frontend/src/features/auth/domain/repository/new_password_interface.dart';

class NewPasswordRepository implements IPassword {
  @override
  Future<User> setNewPassword(UserDto user) {
    throw UnimplementedError();
  }
}