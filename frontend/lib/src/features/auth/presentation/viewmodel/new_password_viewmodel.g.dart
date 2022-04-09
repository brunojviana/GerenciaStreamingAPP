// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_password_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewPasswordViewModel on _NewPasswordViewModelBase, Store {
  final _$codeAtom = Atom(name: '_NewPasswordViewModelBase.code');

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$newPasswordAtom = Atom(name: '_NewPasswordViewModelBase.newPassword');

  @override
  String get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  final _$confirmedNewPasswordAtom =
      Atom(name: '_NewPasswordViewModelBase.confirmedNewPassword');

  @override
  String get confirmedNewPassword {
    _$confirmedNewPasswordAtom.reportRead();
    return super.confirmedNewPassword;
  }

  @override
  set confirmedNewPassword(String value) {
    _$confirmedNewPasswordAtom.reportWrite(value, super.confirmedNewPassword,
        () {
      super.confirmedNewPassword = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_NewPasswordViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_NewPasswordViewModelBaseActionController =
      ActionController(name: '_NewPasswordViewModelBase');

  @override
  void validateCode() {
    final _$actionInfo = _$_NewPasswordViewModelBaseActionController
        .startAction(name: '_NewPasswordViewModelBase.validateCode');
    try {
      return super.validateCode();
    } finally {
      _$_NewPasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNewPassword() {
    final _$actionInfo = _$_NewPasswordViewModelBaseActionController
        .startAction(name: '_NewPasswordViewModelBase.validateNewPassword');
    try {
      return super.validateNewPassword();
    } finally {
      _$_NewPasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmedNewPassword() {
    final _$actionInfo =
        _$_NewPasswordViewModelBaseActionController.startAction(
            name: '_NewPasswordViewModelBase.validateConfirmedNewPassword');
    try {
      return super.validateConfirmedNewPassword();
    } finally {
      _$_NewPasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
code: ${code},
newPassword: ${newPassword},
confirmedNewPassword: ${confirmedNewPassword},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$NewPasswordError on _NewPasswordErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_NewPasswordErrorBase.hasErrors'))
          .value;

  final _$codeAtom = Atom(name: '_NewPasswordErrorBase.code');

  @override
  String? get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String? value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$newPasswordAtom = Atom(name: '_NewPasswordErrorBase.newPassword');

  @override
  String? get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String? value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  final _$confirmedNewPasswordAtom =
      Atom(name: '_NewPasswordErrorBase.confirmedNewPassword');

  @override
  String? get confirmedNewPassword {
    _$confirmedNewPasswordAtom.reportRead();
    return super.confirmedNewPassword;
  }

  @override
  set confirmedNewPassword(String? value) {
    _$confirmedNewPasswordAtom.reportWrite(value, super.confirmedNewPassword,
        () {
      super.confirmedNewPassword = value;
    });
  }

  final _$setNewPasswordAtom =
      Atom(name: '_NewPasswordErrorBase.setNewPassword');

  @override
  String? get setNewPassword {
    _$setNewPasswordAtom.reportRead();
    return super.setNewPassword;
  }

  @override
  set setNewPassword(String? value) {
    _$setNewPasswordAtom.reportWrite(value, super.setNewPassword, () {
      super.setNewPassword = value;
    });
  }

  @override
  String toString() {
    return '''
code: ${code},
newPassword: ${newPassword},
confirmedNewPassword: ${confirmedNewPassword},
setNewPassword: ${setNewPassword},
hasErrors: ${hasErrors}
    ''';
  }
}
