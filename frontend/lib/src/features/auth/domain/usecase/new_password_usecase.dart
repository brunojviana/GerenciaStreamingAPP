import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
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
    else if(newPassword.length < 8){
      return 'validation_lenght'.i18n();
    }
    else if((!newPassword.contains(RegExp(r'[0-9]') , 1)) || ((!newPassword.contains(RegExp(r'[a-z]') , 1))) && (!newPassword.contains(RegExp(r'[A-Z]') , 1))){
        return 'validation_alphanumeric'.i18n();       
    }
    else if(!newPassword.contains(RegExp(r'[!@#\$&*~%^()]'), 1)){
      return 'validation_special_character'.i18n();
    }
    return null;
  }

  String? validateConfirmedNewPassword(String confirmedNewPassword) {
    if (confirmedNewPassword.isEmpty) {
      return 'confirmed_new_password_required'.i18n();
    }
    else if(confirmedNewPassword.length < 8){
      return 'validation_lenght'.i18n();
    }
    else if((!confirmedNewPassword.contains(RegExp(r'[0-9]') , 1)) || ((!confirmedNewPassword.contains(RegExp(r'[a-z]') , 1))) && (!confirmedNewPassword.contains(RegExp(r'[A-Z]') , 1))){
        return 'validation_alphanumeric'.i18n();       
    }
    else if(!confirmedNewPassword.contains(RegExp(r'[!@#\$&*~%^()]'), 1)){
      return 'validation_special_character'.i18n();
    }
    return null;
  }

  Future<User> setNewPassword(String code, String newPassword) {
    return repository.setNewPassword(UserDto(code, newPassword));
  }
}