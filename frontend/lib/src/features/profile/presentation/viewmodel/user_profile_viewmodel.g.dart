// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserProfileViewModel on _UserProfileViewModelBase, Store {
  final _$cpfAtom = Atom(name: '_UserProfileViewModelBase.cpf');

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

  final _$nameAtom = Atom(name: '_UserProfileViewModelBase.name');

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

  final _$emailAtom = Atom(name: '_UserProfileViewModelBase.email');

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

  final _$dateBirthAtom = Atom(name: '_UserProfileViewModelBase.dateBirth');

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

  final _$passwordAtom = Atom(name: '_UserProfileViewModelBase.password');

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

  final _$isLoadingAtom = Atom(name: '_UserProfileViewModelBase.isLoading');

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

  final _$_UserProfileViewModelBaseActionController =
      ActionController(name: '_UserProfileViewModelBase');

  @override
  void validateCpf() {
    final _$actionInfo = _$_UserProfileViewModelBaseActionController
        .startAction(name: '_UserProfileViewModelBase.validateCpf');
    try {
      return super.validateCpf();
    } finally {
      _$_UserProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateName() {
    final _$actionInfo = _$_UserProfileViewModelBaseActionController
        .startAction(name: '_UserProfileViewModelBase.validateName');
    try {
      return super.validateName();
    } finally {
      _$_UserProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail() {
    final _$actionInfo = _$_UserProfileViewModelBaseActionController
        .startAction(name: '_UserProfileViewModelBase.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_UserProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateBirthDate() {
    final _$actionInfo = _$_UserProfileViewModelBaseActionController
        .startAction(name: '_UserProfileViewModelBase.validateBirthDate');
    try {
      return super.validateBirthDate();
    } finally {
      _$_UserProfileViewModelBaseActionController.endAction(_$actionInfo);
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
isLoading: ${isLoading}
    ''';
  }
}

mixin _$UserProfileError on _UserProfileErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_UserProfileErrorBase.hasErrors'))
          .value;

  final _$cpfAtom = Atom(name: '_UserProfileErrorBase.cpf');

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

  final _$nameAtom = Atom(name: '_UserProfileErrorBase.name');

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

  final _$emailAtom = Atom(name: '_UserProfileErrorBase.email');

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

  final _$dateBirthAtom = Atom(name: '_UserProfileErrorBase.dateBirth');

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

  final _$saveChangesAtom = Atom(name: '_UserProfileErrorBase.saveChanges');

  @override
  String? get saveChanges {
    _$saveChangesAtom.reportRead();
    return super.saveChanges;
  }

  @override
  set saveChanges(String? value) {
    _$saveChangesAtom.reportWrite(value, super.saveChanges, () {
      super.saveChanges = value;
    });
  }

  @override
  String toString() {
    return '''
cpf: ${cpf},
name: ${name},
email: ${email},
dateBirth: ${dateBirth},
saveChanges: ${saveChanges},
hasErrors: ${hasErrors}
    ''';
  }
}
