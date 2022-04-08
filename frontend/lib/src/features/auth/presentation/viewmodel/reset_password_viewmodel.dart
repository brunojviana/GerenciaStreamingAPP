import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecase/reset_password_usecase.dart';

part 'reset_password_viewmodel.g.dart';

class ResetPasswordViewModel = _ResetPasswordViewModelBase with _$ResetPasswordViewModel;
abstract class _ResetPasswordViewModelBase with Store {
  final error = ResetPasswordError();
  final _usecase = Modular.get<ResetPasswordUseCase>();

  @observable
  String usermail = '';

  @observable
  bool isLoading = false;

  @action
  void validateUsermail() {
    error.usermail = _usecase.validateUsermail(usermail);
  }

  void resetPassword() async {
    error.clear();

    validateUsermail();

    if (!error.hasErrors) {
      isLoading = true;
      try {
        await _usecase.resetPassword(usermail);
      } on UnimplementedError {
        // TODO: Fix!!!
        error.resetPassword = 'Função não implementada!';
      } finally {
        isLoading = false;
      }
    }
  }
}

class ResetPasswordError = _ResetPasswordErrorBase with _$ResetPasswordError;

abstract class _ResetPasswordErrorBase with Store {
  @observable
  String? usermail;

  @observable
  String? resetPassword;

  @computed
  bool get hasErrors => usermail != null || resetPassword != null;

  void clear() {
    usermail = null;
    resetPassword = null;
  }
}