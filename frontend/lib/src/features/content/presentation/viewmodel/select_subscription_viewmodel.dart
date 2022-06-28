import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/content/presentation/viewmodel/list_contents_viewmodel.dart';
import 'package:http/http.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/domain/model/profile.dart';
import '../../../subscription/domain/model/subscription.dart';
import '../../domain/model/content.dart';
import '../../domain/usecase/select_subscription_usecase.dart';

part 'select_subscription_viewmodel.g.dart';

class SelectSubscriptionViewModel = _SelectSubscriptionViewModelBase with _$SelectSubscriptionViewModel;
abstract class _SelectSubscriptionViewModelBase with Store {
  final _usecase = Modular.get<SelectSubscriptionUseCase>();
  final _usecaseList = Modular.get<ListContentsViewModel>();

  Future<Profile> getSavedUser() async {
    SharedPreferences _user = await SharedPreferences.getInstance();
    String? jsonUser = _user.getString("profile");
    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    Profile _profile = Profile.fromJson(mapUser);
    return _profile;    
  }

  Future<List<Subscription>> loadSubscriptions(int userId) async {
    
    List<Subscription> res = await _usecase.loadSubscriptions(userId);
    return res;
  }

  Future<List<Content>> loadContents(int idSub) async {

    List<Content> res = await _usecaseList.loadContents(idSub);
    print(res);

    return res;
  }
}