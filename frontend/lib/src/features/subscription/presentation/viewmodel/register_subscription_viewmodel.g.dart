// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_subscription_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterSubscriptionViewModel
    on _RegisterSubscriptionViewModelBase, Store {
  final _$dateAtom = Atom(name: '_RegisterSubscriptionViewModelBase.date');

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

  final _$valueAtom = Atom(name: '_RegisterSubscriptionViewModelBase.value');

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

  final _$screensAtom =
      Atom(name: '_RegisterSubscriptionViewModelBase.screens');

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

  final _$paymentAtom =
      Atom(name: '_RegisterSubscriptionViewModelBase.payment');

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
      Atom(name: '_RegisterSubscriptionViewModelBase.resolution');

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
      Atom(name: '_RegisterSubscriptionViewModelBase.isLoading');

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

  final _$_RegisterSubscriptionViewModelBaseActionController =
      ActionController(name: '_RegisterSubscriptionViewModelBase');

  @override
  void validateDate() {
    final _$actionInfo = _$_RegisterSubscriptionViewModelBaseActionController
        .startAction(name: '_RegisterSubscriptionViewModelBase.validateDate');
    try {
      return super.validateDate();
    } finally {
      _$_RegisterSubscriptionViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void validateValue() {
    final _$actionInfo = _$_RegisterSubscriptionViewModelBaseActionController
        .startAction(name: '_RegisterSubscriptionViewModelBase.validateValue');
    try {
      return super.validateValue();
    } finally {
      _$_RegisterSubscriptionViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void validateScreens() {
    final _$actionInfo =
        _$_RegisterSubscriptionViewModelBaseActionController.startAction(
            name: '_RegisterSubscriptionViewModelBase.validateScreens');
    try {
      return super.validateScreens();
    } finally {
      _$_RegisterSubscriptionViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void validatePayment() {
    final _$actionInfo =
        _$_RegisterSubscriptionViewModelBaseActionController.startAction(
            name: '_RegisterSubscriptionViewModelBase.validatePayment');
    try {
      return super.validatePayment();
    } finally {
      _$_RegisterSubscriptionViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void validateResolution() {
    final _$actionInfo =
        _$_RegisterSubscriptionViewModelBaseActionController.startAction(
            name: '_RegisterSubscriptionViewModelBase.validateResolution');
    try {
      return super.validateResolution();
    } finally {
      _$_RegisterSubscriptionViewModelBaseActionController
          .endAction(_$actionInfo);
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

mixin _$RegisterSubscriptionError on _RegisterSubscriptionErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_RegisterSubscriptionErrorBase.hasErrors'))
          .value;

  final _$dateAtom = Atom(name: '_RegisterSubscriptionErrorBase.date');

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

  final _$valueAtom = Atom(name: '_RegisterSubscriptionErrorBase.value');

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

  final _$screensAtom = Atom(name: '_RegisterSubscriptionErrorBase.screens');

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

  final _$paymentAtom = Atom(name: '_RegisterSubscriptionErrorBase.payment');

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

  final _$resolutionAtom =
      Atom(name: '_RegisterSubscriptionErrorBase.resolution');

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
