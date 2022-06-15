import 'package:frontend/src/features/subscription/domain/repository/register_subscription_interface.dart';
import '../../domain/model/subscription.dart';
import '../dto/subscription_dto.dart';

class SubscriptionRepository implements ISubscription {
  @override
  Future<Subscription?> registerSubscription(SubscriptionDto subscription) async {
    throw UnimplementedError();
  }
}