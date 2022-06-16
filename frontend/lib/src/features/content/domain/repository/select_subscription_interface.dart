import '../../../subscription/domain/model/subscription.dart';

abstract class ISelectSubscription {
  Future<List<Subscription>> loadSubscriptions(int userId);
}