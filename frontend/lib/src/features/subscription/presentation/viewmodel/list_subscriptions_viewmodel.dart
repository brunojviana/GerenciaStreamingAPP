import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/auth/data/dto/user_dto.dart';
import 'package:frontend/src/features/subscription/domain/model/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/domain/model/profile.dart';
import '../../domain/model/subscription.dart';
import '../../domain/usecase/list_subscriptions_usecase.dart';
import '../../domain/usecase/select_provider_usecase.dart';

part 'list_subscriptions_viewmodel.g.dart';

class ListSubscriptionsViewModel = _ListSubscriptionsViewModelBase with _$ListSubscriptionsViewModel;
abstract class _ListSubscriptionsViewModelBase with Store {
  final _usecase = Modular.get<ListSubscriptionsUseCase>();
  final _usecaseProvider = Modular.get<SelectProviderUseCase>();

  Future<Profile> getSavedUser() async {
    SharedPreferences _user = await SharedPreferences.getInstance();
    String? jsonUser = _user.getString("profile");
    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    Profile _profile = Profile.fromJson(mapUser);
    return _profile;    
  }


  Future<List<Subscription>> loadSubscriptions(idUser) async {
    List<Subscription> res = await _usecase.loadSubs(idUser);
      return res;
  }

  Future<List<Provider>> loadProviders() async {
    List<Provider> res = await _usecaseProvider.loadProviders();
    return res;
  }
}