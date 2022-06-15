import '../../domain/model/subscription.dart';
import '../../domain/repository/edit_subscription_interface.dart';
import '../dto/subscription_dto.dart';

class EditSubscriptionRepository implements IEditSubscription {
  @override
  Future<Subscription?> editSubscription(SubscriptionDto subscription) async {
    throw UnimplementedError();
  }
}