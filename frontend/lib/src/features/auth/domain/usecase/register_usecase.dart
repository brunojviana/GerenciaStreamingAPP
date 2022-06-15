import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/auth/data/dto/user_register_dto.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localization/localization.dart';
import '../model/profile.dart';
import '../repository/register_interface.dart';

class RegisterUseCase {
  final repository = Modular.get<IRegister>();

  String? validateCpf(String cpf) {
    
    if (cpf.isEmpty) {
      return 'cpf_required'.i18n();
    }
    else if(cpf.length != 11){
      return 'invalid_cpf'.i18n();
    }

    return null;
  }

  String? validateName(String name) {
    if (name.isEmpty) {
      return 'name_required'.i18n();
    }
    else if(name.contains(RegExp(r'[0-9]') , 1)){
      return 'name_required'.i18n();
    }

    return null;
  }

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'usermail_required'.i18n();
    }
    else if (!email.contains("@")){
      return 'invalid_email_address'.i18n();
    }
    
    else if (email.length < 4){
      return 'invalid_email_address'.i18n();
    }

    return null;
  }

  String? validateBirthDate(String dateBirth) {
    if (dateBirth.isEmpty) {
      return 'birthdate_required'.i18n();
    }
    else if (dateBirth.length > 10){
      return 'invalide_birthdate'.i18n();
    }
    
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'login_password_required'.i18n();
    }
    else if(password.length < 8){
      return 'validation_lenght'.i18n();
    }
    else if((!password.contains(RegExp(r'[0-9]') , 1)) || ((!password.contains(RegExp(r'[a-z]') , 1))) && (!password.contains(RegExp(r'[A-Z]') , 1))){
        return 'validation_alphanumeric'.i18n();       
    }
    else if(!password.contains(RegExp(r'[!@#\$&*~%^()]'), 1)){
      return 'validation_special_character'.i18n();
    }

    return null;
  }

  String? validateConfirmedPassword(String password, String confirmedPassword) {
    if (confirmedPassword.isEmpty) {
      return 'confirmed_new_password_required'.i18n();
    }
    else if(confirmedPassword != password){
      return 'different_password'.i18n();
    }
    
    return null;
  }

  Future<int?> register(XFile? photo, String cpf, String name, String email, String dateBirth, String password) {
    return repository.register(UserRegisterDto(photo, cpf, name, email, dateBirth, password));
  }
}