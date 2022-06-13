import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../auth/data/dto/user_dto.dart';
import '../../../subscription/domain/model/subscription.dart';
import '../../domain/usecase/select_subscription_usecase.dart';

part 'select_subscription_viewmodel.g.dart';

class SelectSubscriptionViewModel = _SelectSubscriptionViewModelBase with _$SelectSubscriptionViewModel;
abstract class _SelectSubscriptionViewModelBase with Store {
  final _usecase = Modular.get<SelectSubscriptionUseCase>();

  Future<List<Subscription>> loadSubscriptions(UserDto user) async {
    
    List<Subscription> res = await _usecase.loadSubscriptions(user);
    return res;
  }
}