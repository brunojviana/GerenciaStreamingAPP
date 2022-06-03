import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import 'package:frontend/src/features/subscription/domain/repository/list_subscriptions_interface.dart';
import '../../domain/model/subscription.dart';

class ListSubsciptionsRepository implements IListSubscriptions {
  @override
  Future<List<Subscription>> loadSubscriptions(UserDto user) async {
    throw UnimplementedError();
  }
}