import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/subscription/data/dto/subscription_dto.dart';
import 'package:frontend/src/features/subscription/domain/model/subscription.dart';
import 'package:localization/localization.dart';
import '../repository/edit_subscription_interface.dart';

class EditSubscriptionUseCase {
  final repository = Modular.get<IEditSubscription>();

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

  Future<Subscription?> editSubscription(int userId, int idProvider, String signatureDate, 
                          double price, String periodPayment, int screens, String maxResolution,
                          int content, double useTime, int status) {
    return repository.editSubscription(SubscriptionDto(userId, idProvider, signatureDate, price, 
                        periodPayment, screens, maxResolution, content, useTime, status));
  }
}
