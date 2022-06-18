import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/domain/model/profile.dart';
import '../../domain/usecase/user_profile_usecase.dart';

part 'user_profile_viewmodel.g.dart';

class UserProfileViewModel = _UserProfileViewModelBase with _$UserProfileViewModel;
abstract class _UserProfileViewModelBase with Store {
  final error = UserProfileError();
  final _usecase = Modular.get<UserProfileUseCase>();

  @observable
  String cpf = '';

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String dateBirth = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @action
  void validateCpf() {
    error.cpf = _usecase.validateCpf(cpf);
  }

  @action
  void validateName() {
    error.name = _usecase.validateName(name);
  }

  @action
  void validateEmail() {
    error.email = _usecase.validateEmail(email);
  }

  @action
  void validateBirthDate() {
    error.dateBirth = _usecase.validateBirthDate(dateBirth);
  }

  void saveUser(Profile profile) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(
      "profile", json.encode(profile.toJson())
    );
  }

  Future<Profile> getSavedUser() async {
    SharedPreferences _user = await SharedPreferences.getInstance();
    String? jsonUser = _user.getString("profile");
    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    Profile _profile = Profile.fromJson(mapUser);
    return _profile;    
  }

  Future<int?> editProfile(String? path_image, String password) async {
    error.clear();

    validateCpf();
    validateName();
    validateEmail();
    validateBirthDate();

    if (!error.hasErrors) {
      isLoading = true;
      
      int? res = await _usecase.editProfile(path_image, cpf, name, email, dateBirth, password, null);

      if (res == 201) {
        isLoading = false;
      }

      return res;
    }

    else 
    {
        print("Erro");
        return null;
    }
  }
}

class UserProfileError = _UserProfileErrorBase with _$UserProfileError;

abstract class _UserProfileErrorBase with Store {
  @observable
  String? cpf;
  
  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? dateBirth;

  @observable
  String? saveChanges;

  @computed
  bool get hasErrors => cpf != null || name != null || email != null || 
                                dateBirth != null || saveChanges != null;

  void clear() {
    cpf = null;
    name = null;
    email = null;
    dateBirth = null;
    saveChanges = null;
  }
}