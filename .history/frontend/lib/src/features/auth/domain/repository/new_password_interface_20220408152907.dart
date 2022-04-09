import '../model/user.dart';

abstract class IPassword {
  Future<User> setNewPassword(User user);
}