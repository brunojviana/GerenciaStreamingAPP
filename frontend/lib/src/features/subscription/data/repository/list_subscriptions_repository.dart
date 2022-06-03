import 'package:frontend/src/features/subscription/domain/repository/list_subscriptions_interface.dart';
import '../../../auth/domain/model/user.dart';
import '../../domain/model/subscription.dart';

class ListSubsciptionsRepository implements IListSubscriptions {
  @override
  Future<List<Subscription>> loadSubscriptions(User user) async {
    throw UnimplementedError();
  }
}