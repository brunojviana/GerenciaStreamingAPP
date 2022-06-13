import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import '../../domain/usecase/user_profile_usecase.dart';

part 'user_profile_viewmodel.g.dart';

class UserProfileViewModel = _UserProfileViewModelBase with _$UserProfileViewModel;
abstract class _UserProfileViewModelBase with Store {
  final error = UserProfileError();
  final _usecase = Modular.get<UserProfileUseCase>();

  @observable
  String cpf = '';

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String dateBirth = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @action
  void validateCpf() {
    error.cpf = _usecase.validateCpf(cpf);
  }

  @action
  void validateName() {
    error.name = _usecase.validateName(name);
  }

  @action
  void validateEmail() {
    error.email = _usecase.validateEmail(email);
  }

  @action
  void validateBirthDate() {
    error.dateBirth = _usecase.validateBirthDate(dateBirth);
  }

  Future<int?> editProfile(XFile? photo, String password) async {
    error.clear();

    validateCpf();
    validateName();
    validateEmail();
    validateBirthDate();

    if (!error.hasErrors) {
      isLoading = true;
      
      int? res = await _usecase.editProfile(photo, cpf, name, email, dateBirth, password);

      if (res == 201) {
        isLoading = false;
      }

      return res;
    }

    else 
    {
        print("Erro");
        return null;
    }
  }
}

class UserProfileError = _UserProfileErrorBase with _$UserProfileError;

abstract class _UserProfileErrorBase with Store {
  @observable
  String? cpf;
  
  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? dateBirth;

  @observable
  String? saveChanges;

  @computed
  bool get hasErrors => cpf != null || name != null || email != null || 
                                dateBirth != null || saveChanges != null;

  void clear() {
    cpf = null;
    name = null;
    email = null;
    dateBirth = null;
    saveChanges = null;
  }
}