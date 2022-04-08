import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/auth/domain/usecase/new_password_usecase.dart';
import 'package:mobx/mobx.dart';

part 'new_password_viewmodel.g.dart';

class NewPasswordViewModel = _NewPasswordViewModelBase with _$NewPasswordViewModel;
abstract class _NewPasswordViewModelBase with Store {
  final error = NewPasswordError();
  final _usecase = Modular.get<NewPasswordUseCase>();

  @observable
  String code = '';

  @observable
  String newPassword = '';

  @observable
  String confirmedNewPassword = '';

  @observable
  bool isLoading = false;

  @action
  void validateCode() {
    error.code = _usecase.validateCode(code);
  }

  @action
  void validateNewPassword() {
    error.newPassword = _usecase.validateNewPassword(newPassword);
  }

  @action
  void validateConfirmedNewPassword() {
    error.confirmedNewPassword = _usecase.validateConfirmedNewPassword(confirmedNewPassword);
  }

  void setNewPassword() async {
    error.clear();

    validateCode();
    validateNewPassword();
    validateConfirmedNewPassword();

    if (!error.hasErrors) {
      isLoading = true;
      try {
        await _usecase.setNewPassword(code, newPassword);
      } on UnimplementedError {
        // TODO: Fix!!!
        error.setNewPassword = 'Função não implementada!';
      } finally {
        isLoading = false;
      }
    }
  }
}

class NewPasswordError = _NewPasswordErrorBase with _$NewPasswordError;

abstract class _NewPasswordErrorBase with Store {
  @observable
  String? code;

  @observable
  String? newPassword;

  @observable
  String? confirmedNewPassword;

  @observable
  String? setNewPassword;

  @computed
  bool get hasErrors => code != null || newPassword != null || confirmedNewPassword != null || setNewPassword != null;

  void clear() {
    code = null;
    newPassword = null;
    confirmedNewPassword = null;
    setNewPassword = null;
  }
}