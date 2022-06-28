import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/subscription/domain/usecase/list_subscriptions_usecase.dart';
import 'package:http/http.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/domain/model/profile.dart';
import '../../../subscription/domain/model/subscription.dart';
import '../../domain/model/content.dart';
import '../../domain/usecase/list_contents_usecase.dart';

part 'list_contents_viewmodel.g.dart';

class ListContentsViewModel = _ListContentsViewModelBase with _$ListContentsViewModel;
abstract class _ListContentsViewModelBase with Store {
  final _usecase = Modular.get<ListContentsUseCase>();
  final _usecaseSub = Modular.get<ListSubscriptionsUseCase>();

  Future<Profile> getSavedUser() async {
    SharedPreferences _user = await SharedPreferences.getInstance();
    String? jsonUser = _user.getString("profile");
    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    Profile _profile = Profile.fromJson(mapUser);
    return _profile;    
  }

  Future<List<Content>> loadContents(int idSub) async {
    
    List<Content> res = await _usecase.loadContents(idSub);

    return res;
  }

  Future<Subscription> loadSubscription(int idSub) async {
    Subscription res = await _usecaseSub.loadSubscription(idSub);

    return res;
  }
}