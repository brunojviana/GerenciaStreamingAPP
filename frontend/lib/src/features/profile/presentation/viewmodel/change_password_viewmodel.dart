import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../domain/usecase/change_password_usecase.dart';

part 'change_password_viewmodel.g.dart';

class ChangePasswordViewModel = _ChangePasswordViewModelBase with _$ChangePasswordViewModel;
abstract class _ChangePasswordViewModelBase with Store {
  final error = ChangePasswordError();
  final _usecase = Modular.get<ChangePasswordUseCase>();

  @observable
  String currentPassword = '';

  @observable
  String newPassword = '';

  @observable
  String confirmedNewPassword = '';

  @observable
  bool isLoading = false;

  @action
  void validateCurrentPassword() {
    error.currentPassword = _usecase.validateCurrentPassword(currentPassword);
  }

  @action
  void validateNewPassword() {
    error.newPassword = _usecase.validateNewPassword(newPassword);
  }

  @action
  void validateConfirmedNewPassword() {
    error.confirmedNewPassword = _usecase.validateConfirmedNewPassword(confirmedNewPassword);
  }

  Future<int?> setNewPassword(String password) async {
    error.clear();

    validateCurrentPassword();
    validateNewPassword();
    validateConfirmedNewPassword();

    if (!error.hasErrors) 
    {
      isLoading = true;

      if (currentPassword == password)
      {
        int res = await _usecase.setNewPassword(newPassword);
        
        if (res == 201) 
        {
          isLoading = false;
        }
        return res;
      }
      return null;
    }    
    
    else
    {
      return null;
    }
    
  }
}

class ChangePasswordError = _ChangePasswordErrorBase with _$ChangePasswordError;

abstract class _ChangePasswordErrorBase with Store {
  
  @observable
  String? currentPassword;

  @observable
  String? newPassword;

  @observable
  String? confirmedNewPassword;

  @observable
  String? setNewPassword;

  @computed
  bool get hasErrors => currentPassword != null || newPassword != null 
                        || confirmedNewPassword != null || setNewPassword != null;

  void clear() {
    currentPassword = null;
    newPassword = null;
    confirmedNewPassword = null;
    setNewPassword = null;
  }
}