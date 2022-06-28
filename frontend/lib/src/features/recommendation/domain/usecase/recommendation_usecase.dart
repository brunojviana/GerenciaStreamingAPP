import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../subscription/domain/model/subscription.dart';
import '../repository/recommendation_interface.dart';

class RecommendationUseCase {
  final repository = Modular.get<IRecommendation>();

  String? validateAmount(String amount) {
    
    if (amount.isEmpty) {
      return 'amount_is_required'.i18n();
    }
    return null;
  }

  Future<List<Subscription>?> calculateSubset(double amount) {
    return repository.calculateSubset(amount);
  }
}