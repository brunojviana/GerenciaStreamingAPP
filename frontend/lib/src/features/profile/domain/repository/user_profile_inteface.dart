import 'package:frontend/src/features/auth/data/dto/user_register_dto.dart';

abstract class IEditProfile {
  Future<int?> editProfile(UserRegisterDto userRegister);
}