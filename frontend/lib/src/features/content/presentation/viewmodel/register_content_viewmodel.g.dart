// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_content_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterContentViewModel on _RegisterContentViewModelBase, Store {
  final _$nameAtom = Atom(name: '_RegisterContentViewModelBase.name');

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

  final _$categoryAtom = Atom(name: '_RegisterContentViewModelBase.category');

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_RegisterContentViewModelBase.isLoading');

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

  final _$_RegisterContentViewModelBaseActionController =
      ActionController(name: '_RegisterContentViewModelBase');

  @override
  void validateName() {
    final _$actionInfo = _$_RegisterContentViewModelBaseActionController
        .startAction(name: '_RegisterContentViewModelBase.validateName');
    try {
      return super.validateName();
    } finally {
      _$_RegisterContentViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCategory() {
    final _$actionInfo = _$_RegisterContentViewModelBaseActionController
        .startAction(name: '_RegisterContentViewModelBase.validateCategory');
    try {
      return super.validateCategory();
    } finally {
      _$_RegisterContentViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
category: ${category},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$RegisterContentError on _RegisterContentErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_RegisterContentErrorBase.hasErrors'))
          .value;

  final _$nameAtom = Atom(name: '_RegisterContentErrorBase.name');

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

  final _$categoryAtom = Atom(name: '_RegisterContentErrorBase.category');

  @override
  String? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
category: ${category},
hasErrors: ${hasErrors}
    ''';
  }
}
