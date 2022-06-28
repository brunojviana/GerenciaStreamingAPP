// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecommendationViewModel on _RecommendationViewModelBase, Store {
  final _$amountAtom = Atom(name: '_RecommendationViewModelBase.amount');

  @override
  String get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(String value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_RecommendationViewModelBase.isLoading');

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

  final _$_RecommendationViewModelBaseActionController =
      ActionController(name: '_RecommendationViewModelBase');

  @override
  void validateAmount() {
    final _$actionInfo = _$_RecommendationViewModelBaseActionController
        .startAction(name: '_RecommendationViewModelBase.validateAmount');
    try {
      return super.validateAmount();
    } finally {
      _$_RecommendationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
amount: ${amount},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$RecommendationError on _RecommendationErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_RecommendationErrorBase.hasErrors'))
          .value;

  final _$amountAtom = Atom(name: '_RecommendationErrorBase.amount');

  @override
  String? get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(String? value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  @override
  String toString() {
    return '''
amount: ${amount},
hasErrors: ${hasErrors}
    ''';
  }
}
