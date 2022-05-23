import 'package:frontend/src/features/subscription/register_subscription/domain/repository/subscription_interface.dart';
import 'package:frontend/src/features/subscription/register_subscription/domain/model/subscription_register.dart';

class SubscriptionRepository implements ISubscription {
  @override
  Future<SubscriptionRegister> registerSubscription(SubscriptionRegister subscriptionRegister) async {
    throw UnimplementedError();
  }
}