import 'package:frontend/src/features/auth/data/dto/user_register_dto.dart';

abstract class IRegister {
  Future<int?> register(UserRegisterDto userRegister);
}