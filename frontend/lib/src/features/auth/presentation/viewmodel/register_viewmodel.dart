import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import '../../domain/usecase/register_usecase.dart';

part 'register_viewmodel.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;
abstract class _RegisterViewModelBase with Store {
  final error = RegisterError();
  final _usecase = Modular.get<RegisterUseCase>();

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
  String confirmedPassword = '';

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

  @action
  void validatePassword() {
    error.password = _usecase.validatePassword(password);
  }

  @action
  void validateConfirmedPassword() {
    error.confirmedPassword = _usecase.validateConfirmedPassword(password, confirmedPassword);
  }

  Future<int?> register(XFile? photo) async {
    error.clear();

    validateCpf();
    validateName();
    validateEmail();
    validateBirthDate();
    validatePassword();
    validateConfirmedPassword();

    if (!error.hasErrors) {
      isLoading = true;
      
      int? res = await _usecase.register(photo, cpf, name, email, dateBirth, password);

      if (res == 201) {
        Modular.to.pushNamedAndRemoveUntil('/login', (p0) => false);
        isLoading = false;
      }

      return res;
    } else {
        print("Erro");
        return null;
    }
  }
}

class RegisterError = _RegisterErrorBase with _$RegisterError;

abstract class _RegisterErrorBase with Store {
  @observable
  String? cpf;
  
  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? dateBirth;
  
  @observable
  String? password;

  @observable
  String? confirmedPassword;

  @observable
  String? register;

  @computed
  bool get hasErrors => cpf != null || name != null || email != null || dateBirth != null ||
                        password != null || confirmedPassword != null || register != null;

  void clear() {
    cpf = null;
    name = null;
    email = null;
    dateBirth = null;
    password = null;
    confirmedPassword = null;
    register = null;
  }
}