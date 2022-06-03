import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import '../model/subscription.dart';

abstract class IListSubscriptions {
  Future<List<Subscription>> loadSubscriptions(UserDto user);
}