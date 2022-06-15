import 'package:frontend/src/features/subscription/data/dto/subscription_dto.dart';
import '../model/subscription.dart';

abstract class IEditSubscription {
  Future<Subscription?> editSubscription(SubscriptionDto subscription);
}