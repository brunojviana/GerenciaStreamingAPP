import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../model/user_register.dart';
import '../repository/register_interface.dart';

class RegisterUseCase {
  final repository = Modular.get<IRegister>();

  String? validateCpf(String cpf) {
    if (cpf.isEmpty) {
      return 'cpf_required'.i18n();
    }

    return null;
  }

  String? validateName(String name) {
    if (name.isEmpty) {
      return 'name_required'.i18n();
    }

    return null;
  }

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'usermail_required'.i18n();
    }

    return null;
  }

  String? validateBirthDate(String birthdate) {
    if (birthdate.isEmpty) {
      return 'birthdate_required'.i18n();
    }

    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'login_password_required'.i18n();
    }
    return null;
  }

  Future<UserRegister> register(String cpf, String name, String email, String birthdate, String password) {
    return repository.register(UserRegister(cpf, name, email, birthdate, password));
  }
}