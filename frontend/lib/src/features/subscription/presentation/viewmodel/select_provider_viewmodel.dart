import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/domain/model/profile.dart';
import '../../domain/model/provider.dart';
import '../../domain/usecase/select_provider_usecase.dart';

part 'select_provider_viewmodel.g.dart';

class SelectProviderViewModel = _SelectProviderViewModelBase with _$SelectProviderViewModel;
abstract class _SelectProviderViewModelBase with Store {
  final _usecase = Modular.get<SelectProviderUseCase>();

  List<Provider>? listProviders = [];
  
  Future<Profile> getSavedUser() async {
    SharedPreferences _user = await SharedPreferences.getInstance();
    String? jsonUser = _user.getString("profile");
    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    Profile _profile = Profile.fromJson(mapUser);
    return _profile;    
  }

  Future <List<Provider>?> loadProviders() async {
    
    List<Provider>? res = await _usecase.loadProviders();
    
    return res;
  }
}