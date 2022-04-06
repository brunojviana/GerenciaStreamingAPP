import 'package:frontend/src/features/auth/domain/model/user.dart';
import 'package:frontend/src/features/auth/domain/repository/login_interface.dart';

class LoginRepository implements ILogin {
  @override
  Future<User> login(User user) {
    throw UnimplementedError();
  }
}