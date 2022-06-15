import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import '../model/profile.dart';

abstract class ILogin {
  Future<Profile?> login(UserDto user);
}