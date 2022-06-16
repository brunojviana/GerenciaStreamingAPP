import 'package:flutter_modular/flutter_modular.dart';
import '../../../subscription/domain/model/subscription.dart';
import '../repository/select_subscription_interface.dart';

class SelectSubscriptionUseCase {
  final repository = Modular.get<ISelectSubscription>();

  Future<List<Subscription>> loadSubscriptions(int userId) {
    return repository.loadSubscriptions(userId);
  }
}