import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import '../../../subscription/domain/model/subscription.dart';
import '../repository/select_subscription_interface.dart';

class SelectSubscriptionUseCase {
  final repository = Modular.get<ISelectSubscription>();

  Future<List<Subscription>> loadSubscriptions(UserDto user) {
    return repository.loadSubscriptions(user);
  }
}