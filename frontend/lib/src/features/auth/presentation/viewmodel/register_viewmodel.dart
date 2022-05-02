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

  @action
  void validatePassword() {
    error.password = _usecase.validatePassword(password);
  }

  Future<int?> register() async {
    error.clear();

    validateCpf();
    validateName();
    validateEmail();
    validateBirthDate();
    validatePassword();

    if (!error.hasErrors) {
      isLoading = true;
      
      int? res = await _usecase.register(cpf, name, email, dateBirth, password);

      if (res == 201) {
        Modular.to.navigate('/login');
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
  String? register;

  @computed
  bool get hasErrors => cpf != null || name != null || email != null || dateBirth != null ||
                        password != null || register != null;

  void clear() {
    cpf = null;
    name = null;
    email = null;
    dateBirth = null;
    password = null;
    register = null;
  }
}