// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_provider_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterProviderViewModel on _RegisterProviderViewModelBase, Store {
  final _$nameAtom = Atom(name: '_RegisterProviderViewModelBase.name');

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

  final _$categoryAtom = Atom(name: '_RegisterProviderViewModelBase.category');

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

  final _$isLoadingAtom =
      Atom(name: '_RegisterProviderViewModelBase.isLoading');

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

  final _$_RegisterProviderViewModelBaseActionController =
      ActionController(name: '_RegisterProviderViewModelBase');

  @override
  void validateName() {
    final _$actionInfo = _$_RegisterProviderViewModelBaseActionController
        .startAction(name: '_RegisterProviderViewModelBase.validateName');
    try {
      return super.validateName();
    } finally {
      _$_RegisterProviderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCategory() {
    final _$actionInfo = _$_RegisterProviderViewModelBaseActionController
        .startAction(name: '_RegisterProviderViewModelBase.validateCategory');
    try {
      return super.validateCategory();
    } finally {
      _$_RegisterProviderViewModelBaseActionController.endAction(_$actionInfo);
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

mixin _$RegisterError on _RegisterErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_RegisterErrorBase.hasErrors'))
          .value;

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

  final _$categoryAtom = Atom(name: '_RegisterErrorBase.category');

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
