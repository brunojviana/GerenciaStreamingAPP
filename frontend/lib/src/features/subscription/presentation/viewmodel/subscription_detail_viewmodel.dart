import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/domain/model/profile.dart';
import '../../domain/model/subscription.dart';
import '../../domain/usecase/list_subscriptions_usecase.dart';
import '../../domain/usecase/subscription_detail_usecase.dart';

part 'subscription_detail_viewmodel.g.dart';

class SubscriptionDetailViewModel = _SubscriptionDetailViewModelBase with _$SubscriptionDetailViewModel;
abstract class _SubscriptionDetailViewModelBase with Store {
  final _usecase = Modular.get<SubscriptionDetailUseCase>();
  final _usecaseSubs = Modular.get<ListSubscriptionsUseCase>();

  Future<Profile> getSavedUser() async {
    SharedPreferences _user = await SharedPreferences.getInstance();
    String? jsonUser = _user.getString("profile");
    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    Profile _profile = Profile.fromJson(mapUser);
    return _profile;    
  }

  Future<Subscription> switchStatus(Subscription sub, int status) async {
    
    Subscription res = await _usecase.switchStatus(sub, status);
    return res;
  }

  Future<int> deleteSubscription(int id) async {
    int res = await _usecase.deleteSubscription(id);
    return res;
  }

  Future<List<Subscription>> loadSubscriptions(idUser) async {
    print(idUser);

    List<Subscription> res = await _usecaseSubs.loadSubs(idUser);

    return res;
  }
}