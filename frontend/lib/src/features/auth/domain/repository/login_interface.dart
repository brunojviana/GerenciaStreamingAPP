import '../model/user.dart';

abstract class ILogin {
  Future<int?> login(User user);
}