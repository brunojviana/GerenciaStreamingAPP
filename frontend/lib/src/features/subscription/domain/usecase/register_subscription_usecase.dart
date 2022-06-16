import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/subscription/data/dto/subscription_dto.dart';
import 'package:localization/localization.dart';
import '../model/subscription.dart';
import '../repository/register_subscription_interface.dart';

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

  Future<Subscription?> registerSubscription(int userId, int idProvider, String signatureDate,
                          String price, String periodPayment, String screens, String maxResolution,
                          int content, double useTime, int status) {
    return repository.registerSubscription(SubscriptionDto(userId, idProvider, signatureDate, 
                        price, periodPayment, screens, maxResolution, content, useTime, status));
  }
}
