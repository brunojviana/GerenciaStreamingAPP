import '../../domain/repository/change_password_interface.dart';

class ChangePasswordRepository implements IChangePassword {
  
  @override
  Future<int> setNewPassword(String newPassword) {
    throw UnimplementedError();
  }
}