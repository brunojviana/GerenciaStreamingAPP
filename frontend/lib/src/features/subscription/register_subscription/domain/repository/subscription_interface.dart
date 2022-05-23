import 'package:frontend/src/features/auth/domain/model/user.dart';
import 'package:frontend/src/features/subscription/register_subscription/domain/model/subscription_register.dart';

abstract class ISubscription {
  Future<SubscriptionRegister> registerSubscription(SubscriptionRegister subscriptionRegister);
}
