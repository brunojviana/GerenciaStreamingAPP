import 'package:flutter_modular/flutter_modular.dart';
import '../model/subscription.dart';
import '../repository/subscription_detail_interface.dart';

class SubscriptionDetailUseCase {
  final repository = Modular.get<ISubscriptionDetail>();

  Future<Subscription> switchStatus(Subscription sub, int status) {
    return repository.switchStatus(sub, status);
  }

  Future<int> deleteSubscription(int id) {
    return repository.deleteSubscription(id);
  }
}