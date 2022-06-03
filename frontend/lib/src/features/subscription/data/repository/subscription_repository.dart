import 'package:frontend/src/features/subscription/domain/repository/subscription_interface.dart';
import '../dto/subscription_dto.dart';

class SubscriptionRepository implements ISubscription {
  @override
  Future<SubscriptionDto> registerSubscription(SubscriptionDto subscription) async {
    throw UnimplementedError();
  }
}