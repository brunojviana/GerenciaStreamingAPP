// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChangePasswordViewModel on _ChangePasswordViewModelBase, Store {
  final _$currentPasswordAtom =
      Atom(name: '_ChangePasswordViewModelBase.currentPassword');

  @override
  String get currentPassword {
    _$currentPasswordAtom.reportRead();
    return super.currentPassword;
  }

  @override
  set currentPassword(String value) {
    _$currentPasswordAtom.reportWrite(value, super.currentPassword, () {
      super.currentPassword = value;
    });
  }

  final _$newPasswordAtom =
      Atom(name: '_ChangePasswordViewModelBase.newPassword');

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
      Atom(name: '_ChangePasswordViewModelBase.confirmedNewPassword');

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

  final _$isLoadingAtom = Atom(name: '_ChangePasswordViewModelBase.isLoading');

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

  final _$_ChangePasswordViewModelBaseActionController =
      ActionController(name: '_ChangePasswordViewModelBase');

  @override
  void validateCurrentPassword() {
    final _$actionInfo =
        _$_ChangePasswordViewModelBaseActionController.startAction(
            name: '_ChangePasswordViewModelBase.validateCurrentPassword');
    try {
      return super.validateCurrentPassword();
    } finally {
      _$_ChangePasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNewPassword() {
    final _$actionInfo = _$_ChangePasswordViewModelBaseActionController
        .startAction(name: '_ChangePasswordViewModelBase.validateNewPassword');
    try {
      return super.validateNewPassword();
    } finally {
      _$_ChangePasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmedNewPassword() {
    final _$actionInfo =
        _$_ChangePasswordViewModelBaseActionController.startAction(
            name: '_ChangePasswordViewModelBase.validateConfirmedNewPassword');
    try {
      return super.validateConfirmedNewPassword();
    } finally {
      _$_ChangePasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPassword: ${currentPassword},
newPassword: ${newPassword},
confirmedNewPassword: ${confirmedNewPassword},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$ChangePasswordError on _ChangePasswordErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_ChangePasswordErrorBase.hasErrors'))
          .value;

  final _$currentPasswordAtom =
      Atom(name: '_ChangePasswordErrorBase.currentPassword');

  @override
  String? get currentPassword {
    _$currentPasswordAtom.reportRead();
    return super.currentPassword;
  }

  @override
  set currentPassword(String? value) {
    _$currentPasswordAtom.reportWrite(value, super.currentPassword, () {
      super.currentPassword = value;
    });
  }

  final _$newPasswordAtom = Atom(name: '_ChangePasswordErrorBase.newPassword');

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
      Atom(name: '_ChangePasswordErrorBase.confirmedNewPassword');

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
      Atom(name: '_ChangePasswordErrorBase.setNewPassword');

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
currentPassword: ${currentPassword},
newPassword: ${newPassword},
confirmedNewPassword: ${confirmedNewPassword},
setNewPassword: ${setNewPassword},
hasErrors: ${hasErrors}
    ''';
  }
}
