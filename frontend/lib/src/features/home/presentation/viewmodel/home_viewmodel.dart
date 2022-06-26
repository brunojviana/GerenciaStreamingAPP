import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/home/domain/usecase/list_subscriptions_usecase.dart';
import 'package:frontend/src/features/subscription/domain/usecase/list_subscriptions_usecase.dart';
import 'package:mobx/mobx.dart';
import '../../../auth/domain/model/user.dart';
import '../../../subscription/domain/model/subscription.dart';
import '../../domain/model/userProfile.dart';
import '../../domain/usecase/home_usecase.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;
abstract class _HomeViewModelBase with Store {
  final _usecase = Modular.get<HomeUseCase>();
  final _usecaseSubs = Modular.get<ListSubscriptionsUseCase>();

  Future<UserProfile> getProfile(User user) async {
    
    UserProfile res = await _usecase.getProfile(user);
    return res;
    
  }

  Future<List<Subscription>> getSubs(int idUser) async {
    
    List<Subscription> res = await _usecaseSubs.loadSubs(idUser);

    return res;
  }

}
