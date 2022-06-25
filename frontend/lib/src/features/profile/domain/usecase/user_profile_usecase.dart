import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/auth/data/dto/user_register_dto.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localization/localization.dart';
import '../repository/user_profile_inteface.dart';

class UserProfileUseCase {
  final repository = Modular.get<IEditProfile>();

  String? validateCpf(String cpf) {
    
    if(cpf.length != 11){
      return 'invalid_cpf'.i18n();
    }

    return null;
  }

  String? validateName(String name) {
    
    if(name.contains(RegExp(r'[a-z]'))){
      return 'name_required'.i18n();
    }

    return null;
  }

  String? validateEmail(String email) {
    
    if (!email.contains("@")){
      return 'invalid_email_address'.i18n();
    }
    
    else if (email.length < 4){
      return 'invalid_email_address'.i18n();
    }

    return null;
  }

  String? validateBirthDate(String dateBirth) {
    
    if (dateBirth.isNotEmpty && dateBirth.length > 10){
      return 'invalide_birthdate'.i18n();
    }
    
    return null;
  }

  Future<int?> editProfile(String? path_image, String cpf, String name, String email, String dateBirth, String password, String? access_token) {
    return repository.editProfile(UserRegisterDto(path_image, cpf, name, email, dateBirth, password, access_token));
  }
}