// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_content_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditContentViewModel on _EditContentViewModelBase, Store {
  final _$nameAtom = Atom(name: '_EditContentViewModelBase.name');

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

  final _$categoryAtom = Atom(name: '_EditContentViewModelBase.category');

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

  final _$isLoadingAtom = Atom(name: '_EditContentViewModelBase.isLoading');

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

  final _$_EditContentViewModelBaseActionController =
      ActionController(name: '_EditContentViewModelBase');

  @override
  void validateName() {
    final _$actionInfo = _$_EditContentViewModelBaseActionController
        .startAction(name: '_EditContentViewModelBase.validateName');
    try {
      return super.validateName();
    } finally {
      _$_EditContentViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCategory() {
    final _$actionInfo = _$_EditContentViewModelBaseActionController
        .startAction(name: '_EditContentViewModelBase.validateCategory');
    try {
      return super.validateCategory();
    } finally {
      _$_EditContentViewModelBaseActionController.endAction(_$actionInfo);
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

mixin _$EditContentError on _EditContentErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_EditContentErrorBase.hasErrors'))
          .value;

  final _$nameAtom = Atom(name: '_EditContentErrorBase.name');

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

  final _$categoryAtom = Atom(name: '_EditContentErrorBase.category');

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
