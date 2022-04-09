import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/auth/domain/repository/reset_password_interface.dart';
import 'package:localization/localization.dart';

class ResetPasswordUseCase {
  final repository = Modular.get<IReset>();

  String? validateUsermail(String usermail) {
    if (usermail.isEmpty) {
      return 'usermail_required'.i18n();
    }

    return null;
  }

  Future<String> resetPassword(String usermail) {
    return repository.resetPassword(usermail);
  }
}