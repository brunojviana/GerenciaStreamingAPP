import '../../../auth/domain/model/user.dart';
import '../model/subscription.dart';

abstract class IListSubscriptions {
  Future<List<Subscription>> loadSubscriptions(User user);
}