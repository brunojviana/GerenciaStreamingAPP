import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import 'package:mobx/mobx.dart';
import '../../domain/model/subscription.dart';
import '../../domain/usecase/list_subscriptions_usecase.dart';

part 'list_subscriptions_viewmodel.g.dart';

class ListSubscriptionsViewModel = _ListSubscriptionsViewModelBase with _$ListSubscriptionsViewModel;
abstract class _ListSubscriptionsViewModelBase with Store {
  final _usecase = Modular.get<ListSubscriptionsUseCase>();

  List<Subscription> listSubscriptions = [];

    Future<List<Subscription>> loadSubscriptions(UserDto user) async {
    
    List<Subscription> res = await _usecase.loadSubscriptions(user);
    return res;
    }
}