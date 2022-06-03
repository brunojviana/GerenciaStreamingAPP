import 'package:flutter_modular/flutter_modular.dart';
import '../repository/subscription_detail_interface.dart';

class SubscriptionDetailUseCase {
  final repository = Modular.get<ISubscriptionDetail>();

  Future<int> switchStatus(int status) {
    return repository.switchStatus(status);
  }

  Future<int> deleteSubscription(int id) {
    return repository.deleteSubscription(id);
  }
}