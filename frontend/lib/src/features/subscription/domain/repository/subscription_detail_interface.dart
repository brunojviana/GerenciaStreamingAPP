import '../model/subscription.dart';

abstract class ISubscriptionDetail {
  Future<Subscription> switchStatus(Subscription sub, int status);
  Future<int> deleteSubscription(int id);
}