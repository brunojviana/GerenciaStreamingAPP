import '../model/user_register.dart';

abstract class IRegister {
  Future<UserRegister> register(UserRegister userRegister);
}