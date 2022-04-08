// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResetPasswordViewModel on _ResetPasswordViewModelBase, Store {
  final _$usermailAtom = Atom(name: '_ResetPasswordViewModelBase.usermail');

  @override
  String get usermail {
    _$usermailAtom.reportRead();
    return super.usermail;
  }

  @override
  set usermail(String value) {
    _$usermailAtom.reportWrite(value, super.usermail, () {
      super.usermail = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ResetPasswordViewModelBase.isLoading');

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

  final _$_ResetPasswordViewModelBaseActionController =
      ActionController(name: '_ResetPasswordViewModelBase');

  @override
  void validateUsermail() {
    final _$actionInfo = _$_ResetPasswordViewModelBaseActionController
        .startAction(name: '_ResetPasswordViewModelBase.validateUsermail');
    try {
      return super.validateUsermail();
    } finally {
      _$_ResetPasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usermail: ${usermail},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$ResetPasswordError on _ResetPasswordErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_ResetPasswordErrorBase.hasErrors'))
          .value;

  final _$usermailAtom = Atom(name: '_ResetPasswordErrorBase.usermail');

  @override
  String? get usermail {
    _$usermailAtom.reportRead();
    return super.usermail;
  }

  @override
  set usermail(String? value) {
    _$usermailAtom.reportWrite(value, super.usermail, () {
      super.usermail = value;
    });
  }

  final _$resetPasswordAtom =
      Atom(name: '_ResetPasswordErrorBase.resetPassword');

  @override
  String? get resetPassword {
    _$resetPasswordAtom.reportRead();
    return super.resetPassword;
  }

  @override
  set resetPassword(String? value) {
    _$resetPasswordAtom.reportWrite(value, super.resetPassword, () {
      super.resetPassword = value;
    });
  }

  @override
  String toString() {
    return '''
usermail: ${usermail},
resetPassword: ${resetPassword},
hasErrors: ${hasErrors}
    ''';
  }
}
