import '../model/user_register.dart';

abstract class IRegister {
  Future<int?> register(UserRegister userRegister);
}