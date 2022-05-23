import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../model/subscription_register.dart';
import '../repository/subscription_interface.dart';

class SubscriptionUseCase {
  final repository = Modular.get<ISubscription>();

  String? validateDate(String date) {
    
    if (date.isEmpty) {
      return 'date_subscription_required'.i18n();
    }
    return null;
  }

  String? validateValue(String value) {
    if (value.isEmpty) {
      return 'value_required'.i18n(); 
    }
    return null;
  }

  String? validateScreens(String screens) {
    if (screens.isEmpty) {
      return 'screens_required'.i18n(); 
    }
    return null;
  }

  String? validatePayment(String payment) {
    if (payment.isEmpty) {
      return 'usermail_required'.i18n(); //TODO
    }
    return null;
  }

  String? validateResolution(String resolution) {
    if (resolution.isEmpty) {
      return 'usermail_required'.i18n(); //TODO
    }
    return null;
  }

  Future<SubscriptionRegister?> registerSubscription(String date, String value, String screens, String payment, String resolution) {
    return repository.registerSubscription(SubscriptionRegister(date, value, screens, payment, resolution));
  }
}

