import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/content/domain/usecase/list_contents_usecase.dart';
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
  final _usecaseList = Modular.get<ListContentsUseCase>();

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
      DateTime now = DateTime.now();
      String startDate = "${now.year}-0${now.month}-${now.day} ${now.hour}:${now.minute}";
      
      /* List<String> dateFormat = date.split(' ');
      final String dataFinal = "${dateFormat[0].split('/')[2]}-${dateFormat[0].split('/')[1]}-${dateFormat[0].split('/')[0]} ${dateFormat[1]}";

      List<String> dateFormatLast = lastAcess.split(' ');
      final String dataFinalLast = "${dateFormatLast[0].split('/')[2]}-${dateFormatLast[0].split('/')[1]}-${dateFormatLast[0].split('/')[0]} ${dateFormatLast[1]}";
      */

      Content? res = await _usecase.registerContent(
        subscriptionId,
        name, 
        category,
        startDate,
        startDate,
        status);
      
      if (res != null) {
        return res;
      }
      return null;
    } 
    else {
      return null;
    }
  }

  Future<List<Content>> loadContents(int idSub) async {

    List<Content> res = await _usecaseList.loadContents(idSub);
    print(res);

    return res;
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