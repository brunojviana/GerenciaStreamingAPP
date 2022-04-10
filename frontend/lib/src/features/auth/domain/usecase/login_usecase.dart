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
    else if (!usermail.contains("@")){
      return 'invalid_email_address'.i18n();
    }
    
    else if (usermail.length < 4){
      return 'invalid_email_address'.i18n();
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

  Future<User> login(String usermail, String password) {
    return repository.login(User(usermail, password));
  }
}