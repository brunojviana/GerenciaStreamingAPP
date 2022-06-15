import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/domain/model/profile.dart';
import '../../../subscription/domain/model/provider.dart';
import '../../domain/model/content.dart';
import '../../domain/usecase/register_content_usecase.dart';

part 'register_content_viewmodel.g.dart';

class RegisterContentViewModel = _RegisterContentViewModelBase with _$RegisterContentViewModel;
abstract class _RegisterContentViewModelBase with Store {
  
  final error = RegisterContentError();
  final _usecase = Modular.get<RegisterContentUseCase>();

  @observable
  String name = '';

  @observable
  String category = '';

  @observable
  bool isLoading = false;

  int id = 0;

  DateTime startDate = DateTime.now();

  int status = 1;

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

  Future<Content?> registerContent(int subscriptionId) async {
    
    error.clear();

    validateName();
    validateCategory();

    if (!error.hasErrors) {
      isLoading = true;
      Content? res = await _usecase.registerContent(
        id,
        subscriptionId,
        name, 
        category,
        startDate,
        startDate,
        status);
      return res;
    } 
    else {
      return null;
    }
  }
}

class RegisterContentError = _RegisterContentErrorBase with _$RegisterContentError;

abstract class _RegisterContentErrorBase with Store {
  
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