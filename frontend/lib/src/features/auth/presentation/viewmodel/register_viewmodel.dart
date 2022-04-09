import 'package:flutter_modular/flutter_modular.dart';
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
  String birthdate = '';

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
    error.birthdate = _usecase.validateBirthDate(birthdate);
  }

  @action
  void validatePassword() {
    error.password = _usecase.validatePassword(password);
  }

  void register() async {
    error.clear();

    validateCpf();
    validateName();
    validateEmail();
    validateBirthDate();
    validatePassword();

    if (!error.hasErrors) {
      isLoading = true;
      try {
        await _usecase.register(cpf, name, email, birthdate, password);
      } on UnimplementedError {
        // TODO: Fix!!!
        error.register = 'Função não implementada!';
      } finally {
        isLoading = false;
      }
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
  String? birthdate;
  
  @observable
  String? password;

  @observable
  String? register;

  @computed
  bool get hasErrors => cpf != null || name != null || email != null || birthdate != null ||
                        password != null || register != null;

  void clear() {
    cpf = null;
    name = null;
    email = null;
    birthdate = null;
    password = null;
    register = null;
  }
}