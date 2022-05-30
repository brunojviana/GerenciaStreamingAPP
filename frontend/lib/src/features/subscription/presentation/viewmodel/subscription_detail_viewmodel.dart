import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../data/dto/subscription_dto.dart';
import '../../domain/usecase/subscription_detail_usecase.dart';

part 'subscription_detail_viewmodel.g.dart';

class SubscriptionDetailViewModel = _SubscriptionDetailViewModelBase with _$SubscriptionDetailViewModel;
abstract class _SubscriptionDetailViewModelBase with Store {
  final _usecase = Modular.get<SubscriptionDetailUseCase>();

  Future<int> switchStatus(int status) async {
    
    int res = await _usecase.switchStatus(status);
    return res;
  }

  Future<int> deleteSubscription(SubscriptionDto subscription) async {
    
    int res = await _usecase.deleteSubscription(subscription);
    return res;
  }
}