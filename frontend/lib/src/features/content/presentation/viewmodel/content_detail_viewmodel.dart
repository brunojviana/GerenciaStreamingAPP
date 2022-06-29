import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/content/domain/usecase/list_contents_usecase.dart';
import 'package:http/http.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/domain/model/profile.dart';
import '../../domain/model/content.dart';
import '../../domain/usecase/content_detail_usecase.dart';

part 'content_detail_viewmodel.g.dart';

class ContentDetailViewModel = _ContentDetailViewModelBase with _$ContentDetailViewModel;
abstract class _ContentDetailViewModelBase with Store {
  final _usecase = Modular.get<ContentDetailUseCase>();
  final _usecaseContents = Modular.get<ListContentsUseCase>();

  Future<Profile> getSavedUser() async {
    SharedPreferences _user = await SharedPreferences.getInstance();
    String? jsonUser = _user.getString("profile");
    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    Profile _profile = Profile.fromJson(mapUser);
    return _profile;    
  }

  Future<Content> switchStatus(int status, Content cnt) async {

    DateTime now = DateTime.now();
    String lastDate = "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}";

    cnt.lastAccess = lastDate;
    cnt.status = status;
    
    Content res = await _usecase.switchStatus(status, cnt);

    return res;
  }

  Future<int> deleteContent(int id) async {
    
    int res = await _usecase.deleteContent(id);
    return res;
  }

  Future<List<Content>> loadContents(idSub) async {
    List<Content> res = await _usecaseContents.loadContents(idSub);
    return res;
  }
}