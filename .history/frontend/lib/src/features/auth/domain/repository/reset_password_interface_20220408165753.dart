import '../model/user.dart';

abstract class IReset {
  Future<User> resetPassword(String usermail);
}