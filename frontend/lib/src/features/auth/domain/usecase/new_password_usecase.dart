import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/auth/domain/repository/new_password_interface.dart';
import 'package:localization/localization.dart';

import '../model/user.dart';

class NewPasswordUseCase {
  final repository = Modular.get<IPassword>();

  String? validateCode(String code) {
    if (code.isEmpty) {
      return 'code_required'.i18n();
    }

    return null;
  }

  String? validateNewPassword(String newPassword) {
    if (newPassword.isEmpty) {
      return 'new_password_required'.i18n();
    }
    return null;
  }

  String? validateConfirmedNewPassword(String confirmedNewPassword) {
    if (confirmedNewPassword.isEmpty) {
      return 'confirmed_new_password_required'.i18n();
    }
    return null;
  }

  Future<User> setNewPassword(String code, String newPassword) {
    return repository.setNewPassword(User(code, newPassword));
  }
}