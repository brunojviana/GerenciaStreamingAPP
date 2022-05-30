import 'package:frontend/src/features/subscription/data/dto/subscription_dto.dart';

abstract class ISubscriptionDetail {
  Future<int> switchStatus(int status);
  Future<int> deleteSubscription(SubscriptionDto subscription);
}