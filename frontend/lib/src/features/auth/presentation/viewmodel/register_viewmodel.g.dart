// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterViewModel on _RegisterViewModelBase, Store {
  final _$cpfAtom = Atom(name: '_RegisterViewModelBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$nameAtom = Atom(name: '_RegisterViewModelBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterViewModelBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$dateBirthAtom = Atom(name: '_RegisterViewModelBase.dateBirth');

  @override
  String get dateBirth {
    _$dateBirthAtom.reportRead();
    return super.dateBirth;
  }

  @override
  set dateBirth(String value) {
    _$dateBirthAtom.reportWrite(value, super.dateBirth, () {
      super.dateBirth = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegisterViewModelBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmedPasswordAtom =
      Atom(name: '_RegisterViewModelBase.confirmedPassword');

  @override
  String get confirmedPassword {
    _$confirmedPasswordAtom.reportRead();
    return super.confirmedPassword;
  }

  @override
  set confirmedPassword(String value) {
    _$confirmedPasswordAtom.reportWrite(value, super.confirmedPassword, () {
      super.confirmedPassword = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_RegisterViewModelBase.isLoading');

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

  final _$_RegisterViewModelBaseActionController =
      ActionController(name: '_RegisterViewModelBase');

  @override
  void validateCpf() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.validateCpf');
    try {
      return super.validateCpf();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateName() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.validateName');
    try {
      return super.validateName();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateBirthDate() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.validateBirthDate');
    try {
      return super.validateBirthDate();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmedPassword() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.validateConfirmedPassword');
    try {
      return super.validateConfirmedPassword();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cpf: ${cpf},
name: ${name},
email: ${email},
dateBirth: ${dateBirth},
password: ${password},
confirmedPassword: ${confirmedPassword},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$RegisterError on _RegisterErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_RegisterErrorBase.hasErrors'))
          .value;

  final _$cpfAtom = Atom(name: '_RegisterErrorBase.cpf');

  @override
  String? get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String? value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$nameAtom = Atom(name: '_RegisterErrorBase.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterErrorBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$dateBirthAtom = Atom(name: '_RegisterErrorBase.dateBirth');

  @override
  String? get dateBirth {
    _$dateBirthAtom.reportRead();
    return super.dateBirth;
  }

  @override
  set dateBirth(String? value) {
    _$dateBirthAtom.reportWrite(value, super.dateBirth, () {
      super.dateBirth = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegisterErrorBase.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmedPasswordAtom =
      Atom(name: '_RegisterErrorBase.confirmedPassword');

  @override
  String? get confirmedPassword {
    _$confirmedPasswordAtom.reportRead();
    return super.confirmedPassword;
  }

  @override
  set confirmedPassword(String? value) {
    _$confirmedPasswordAtom.reportWrite(value, super.confirmedPassword, () {
      super.confirmedPassword = value;
    });
  }

  final _$registerAtom = Atom(name: '_RegisterErrorBase.register');

  @override
  String? get register {
    _$registerAtom.reportRead();
    return super.register;
  }

  @override
  set register(String? value) {
    _$registerAtom.reportWrite(value, super.register, () {
      super.register = value;
    });
  }

  @override
  String toString() {
    return '''
cpf: ${cpf},
name: ${name},
email: ${email},
dateBirth: ${dateBirth},
password: ${password},
confirmedPassword: ${confirmedPassword},
register: ${register},
hasErrors: ${hasErrors}
    ''';
  }
}
