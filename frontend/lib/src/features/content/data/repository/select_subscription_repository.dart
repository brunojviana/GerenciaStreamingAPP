import 'package:frontend/src/features/auth/data/dto/user_dto.dart';import '../../../subscription/domain/model/subscription.dart';
import '../../domain/repository/select_subscription_interface.dart';

class SelectSubscriptionRepository implements ISelectSubscription {
  @override
  Future<List<Subscription>> loadSubscriptions(UserDto user) async {
    throw UnimplementedError();
  }
}