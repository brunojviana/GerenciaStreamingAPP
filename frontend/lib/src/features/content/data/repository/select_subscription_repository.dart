import '../../../subscription/domain/model/subscription.dart';
import '../../domain/repository/select_subscription_interface.dart';

class SelectSubscriptionRepository implements ISelectSubscription {
  @override
  Future<List<Subscription>> loadSubscriptions(int userId) async {
    throw UnimplementedError();
  }
}