import 'package:frontend/src/features/auth/domain/repository/register_interface.dart';
import '../../domain/model/user_register.dart';


class RegisterRepository implements IRegister {
  @override
  Future<UserRegister> register(UserRegister userRegister) {
    throw UnimplementedError();
  }
}