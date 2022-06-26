import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import '../model/subscription.dart';
import '../repository/list_subscriptions_interface.dart';

class ListSubscriptionsUseCase {
  final repository = Modular.get<IListSubscriptions>();

  Future<List<Subscription>> loadSubs(int idUser) {
    return repository.loadSubs(idUser);
  }
}