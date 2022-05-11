import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../domain/usecase/login_usecase.dart';

part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;
abstract class _LoginViewModelBase with Store {
  final error = LoginError();
  final _usecase = Modular.get<LoginUseCase>();

  @observable
  String usermail = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @action
  void validateUsermail() {
    error.usermail = _usecase.validateUsermail(usermail);
  }

  @action
  void validatePassword() {
    error.password = _usecase.validatePassword(password);
  }

  Future<int?> login() async {
    error.clear();

    validateUsermail();
    validatePassword();

    if (!error.hasErrors) {
      isLoading = true;

      int? res = await _usecase.login(usermail, password);

      print(res);

      if (res == 201) {
        Modular.to.pushNamedAndRemoveUntil('/reset', (p0) => false);
        isLoading = false;
      }

      return res;
    } else {
        print("Erro");
        return null;
    }
  }
}

class LoginError = _LoginErrorBase with _$LoginError;

abstract class _LoginErrorBase with Store {
  @observable
  String? usermail;

  @observable
  String? password;

  @observable
  String? login;

  @computed
  bool get hasErrors => usermail != null || password != null || login != null;

  void clear() {
    usermail = null;
    password = null;
    login = null;
  }
}