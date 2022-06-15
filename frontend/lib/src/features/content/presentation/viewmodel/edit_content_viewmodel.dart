import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/domain/model/profile.dart';
import '../../domain/model/content.dart';
import '../../domain/usecase/edit_content_usecase.dart';

part 'edit_content_viewmodel.g.dart';

class EditContentViewModel = _EditContentViewModelBase with _$EditContentViewModel;
abstract class _EditContentViewModelBase with Store {
  
  final error = EditContentError();
  final _usecase = Modular.get<EditContentUseCase>();

  @observable
  String name = '';

  @observable
  String category = '';

  @observable
  bool isLoading = false;

  @action
  void validateName() {
    error.name = _usecase.validateName(name);
  }

  @action
  void validateCategory() {
    error.category = _usecase.validateCategory(category);
  }

  Future<Profile> getSavedUser() async {
    SharedPreferences _user = await SharedPreferences.getInstance();
    String? jsonUser = _user.getString("profile");
    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    Profile _profile = Profile.fromJson(mapUser);
    return _profile;    
  }

  Future<Content?> editContent(
    int id, 
    int subscriptionId, 
    DateTime startDate,
    DateTime lastAccess,
    int status) async {
    
    error.clear();
    validateName();
    validateCategory();

    if (!error.hasErrors) {
      isLoading = true;
      Content? res = await _usecase.editContent(
        id,
        subscriptionId,
        name, 
        category,
        startDate,
        lastAccess,
        status);
      return res;
    } 
    else 
    {
      return null;
    }
  }
}

class EditContentError = _EditContentErrorBase with _$EditContentError;

abstract class _EditContentErrorBase with Store {
  
  @observable
  String? name;
  
  @observable
  String? category;

  @computed
  bool get hasErrors => name != null || category != null;

  void clear() {
    name = null;
    category = null;
  }
}