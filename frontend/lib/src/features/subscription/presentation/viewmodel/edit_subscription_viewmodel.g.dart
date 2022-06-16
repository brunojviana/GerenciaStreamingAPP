// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_subscription_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditSubscriptionViewModel on _EditSubscriptionViewModelBase, Store {
  final _$dateAtom = Atom(name: '_EditSubscriptionViewModelBase.date');

  @override
  String get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$valueAtom = Atom(name: '_EditSubscriptionViewModelBase.value');

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$screensAtom = Atom(name: '_EditSubscriptionViewModelBase.screens');

  @override
  String get screens {
    _$screensAtom.reportRead();
    return super.screens;
  }

  @override
  set screens(String value) {
    _$screensAtom.reportWrite(value, super.screens, () {
      super.screens = value;
    });
  }

  final _$paymentAtom = Atom(name: '_EditSubscriptionViewModelBase.payment');

  @override
  String get payment {
    _$paymentAtom.reportRead();
    return super.payment;
  }

  @override
  set payment(String value) {
    _$paymentAtom.reportWrite(value, super.payment, () {
      super.payment = value;
    });
  }

  final _$resolutionAtom =
      Atom(name: '_EditSubscriptionViewModelBase.resolution');

  @override
  String get resolution {
    _$resolutionAtom.reportRead();
    return super.resolution;
  }

  @override
  set resolution(String value) {
    _$resolutionAtom.reportWrite(value, super.resolution, () {
      super.resolution = value;
    });
  }

  final _$isLoadingAtom =
      Atom(name: '_EditSubscriptionViewModelBase.isLoading');

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

  final _$_EditSubscriptionViewModelBaseActionController =
      ActionController(name: '_EditSubscriptionViewModelBase');

  @override
  void validateDate() {
    final _$actionInfo = _$_EditSubscriptionViewModelBaseActionController
        .startAction(name: '_EditSubscriptionViewModelBase.validateDate');
    try {
      return super.validateDate();
    } finally {
      _$_EditSubscriptionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateValue() {
    final _$actionInfo = _$_EditSubscriptionViewModelBaseActionController
        .startAction(name: '_EditSubscriptionViewModelBase.validateValue');
    try {
      return super.validateValue();
    } finally {
      _$_EditSubscriptionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateScreens() {
    final _$actionInfo = _$_EditSubscriptionViewModelBaseActionController
        .startAction(name: '_EditSubscriptionViewModelBase.validateScreens');
    try {
      return super.validateScreens();
    } finally {
      _$_EditSubscriptionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePayment() {
    final _$actionInfo = _$_EditSubscriptionViewModelBaseActionController
        .startAction(name: '_EditSubscriptionViewModelBase.validatePayment');
    try {
      return super.validatePayment();
    } finally {
      _$_EditSubscriptionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateResolution() {
    final _$actionInfo = _$_EditSubscriptionViewModelBaseActionController
        .startAction(name: '_EditSubscriptionViewModelBase.validateResolution');
    try {
      return super.validateResolution();
    } finally {
      _$_EditSubscriptionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
date: ${date},
value: ${value},
screens: ${screens},
payment: ${payment},
resolution: ${resolution},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$EditSubscriptionError on _EditSubscriptionErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_EditSubscriptionErrorBase.hasErrors'))
          .value;

  final _$dateAtom = Atom(name: '_EditSubscriptionErrorBase.date');

  @override
  String? get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String? value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$valueAtom = Atom(name: '_EditSubscriptionErrorBase.value');

  @override
  String? get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String? value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$screensAtom = Atom(name: '_EditSubscriptionErrorBase.screens');

  @override
  String? get screens {
    _$screensAtom.reportRead();
    return super.screens;
  }

  @override
  set screens(String? value) {
    _$screensAtom.reportWrite(value, super.screens, () {
      super.screens = value;
    });
  }

  final _$paymentAtom = Atom(name: '_EditSubscriptionErrorBase.payment');

  @override
  String? get payment {
    _$paymentAtom.reportRead();
    return super.payment;
  }

  @override
  set payment(String? value) {
    _$paymentAtom.reportWrite(value, super.payment, () {
      super.payment = value;
    });
  }

  final _$resolutionAtom = Atom(name: '_EditSubscriptionErrorBase.resolution');

  @override
  String? get resolution {
    _$resolutionAtom.reportRead();
    return super.resolution;
  }

  @override
  set resolution(String? value) {
    _$resolutionAtom.reportWrite(value, super.resolution, () {
      super.resolution = value;
    });
  }

  @override
  String toString() {
    return '''
date: ${date},
value: ${value},
screens: ${screens},
payment: ${payment},
resolution: ${resolution},
hasErrors: ${hasErrors}
    ''';
  }
}
