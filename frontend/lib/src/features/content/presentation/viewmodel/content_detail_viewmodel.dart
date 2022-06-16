import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/domain/model/profile.dart';
import '../../domain/usecase/content_detail_usecase.dart';

part 'content_detail_viewmodel.g.dart';

class ContentDetailViewModel = _ContentDetailViewModelBase with _$ContentDetailViewModel;
abstract class _ContentDetailViewModelBase with Store {
  final _usecase = Modular.get<ContentDetailUseCase>();

  Future<Profile> getSavedUser() async {
    SharedPreferences _user = await SharedPreferences.getInstance();
    String? jsonUser = _user.getString("profile");
    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    Profile _profile = Profile.fromJson(mapUser);
    return _profile;    
  }

  Future<int> switchStatus(int status) async {
    
    int res = await _usecase.switchStatus(status);
    return res;
  }

  Future<int> deleteContent(int id) async {
    
    int res = await _usecase.deleteContent(id);
    return res;
  }
}