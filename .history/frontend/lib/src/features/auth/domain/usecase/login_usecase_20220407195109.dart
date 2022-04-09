import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../model/user.dart';
import '../repository/login_interface.dart';

class LoginUseCase {
  final repository = Modular.get<ILogin>();

  String? validateUsermail(String usermail) {
    if (usermail.isEmpty) {
      return 'usermail_required'.i18n();
    }

    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'login_password_required'.i18n();
    }
    return null;
  }

  Future<User> login(String usermail, String password) {
    return repository.login(User(usermail, password));
  }
}