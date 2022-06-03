import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import '../../../subscription/domain/model/subscription.dart';

abstract class ISelectSubscription {
  Future<List<Subscription>> loadSubscriptions(UserDto user);
}