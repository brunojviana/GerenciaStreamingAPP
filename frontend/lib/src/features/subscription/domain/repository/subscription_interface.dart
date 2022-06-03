import 'package:frontend/src/features/subscription/data/dto/subscription_dto.dart';

abstract class ISubscription {
  Future<SubscriptionDto> registerSubscription(SubscriptionDto subscription);
}
