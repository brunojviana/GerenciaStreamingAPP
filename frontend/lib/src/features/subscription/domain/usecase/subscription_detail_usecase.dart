import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/subscription/data/dto/subscription_dto.dart';
import '../repository/subscription_detail_interface.dart';

class SubscriptionDetailUseCase {
  final repository = Modular.get<ISubscriptionDetail>();

  Future<int> switchStatus(int status) {
    return repository.switchStatus(status);
  }

  Future<int> deleteSubscription(SubscriptionDto subscription) {
    return repository.deleteSubscription(subscription);
  }
}