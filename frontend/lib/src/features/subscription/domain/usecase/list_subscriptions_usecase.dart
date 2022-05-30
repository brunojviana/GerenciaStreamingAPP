import 'package:flutter_modular/flutter_modular.dart';
import '../../../auth/domain/model/user.dart';
import '../model/subscription.dart';
import '../repository/list_subscriptions_interface.dart';

class ListSubscriptionsUseCase {
  final repository = Modular.get<IListSubscriptions>();

  Future<List<Subscription>> loadSubscriptions(User user) {
    return repository.loadSubscriptions(user);
  }
}