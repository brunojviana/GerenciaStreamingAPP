import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/model/profile.dart';
import '../../domain/usecase/register_usecase.dart';
part 'register_viewmodel.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;
abstract class _RegisterViewModelBase with Store {
  final error = RegisterError();
  final _usecase = Modular.get<RegisterUseCase>();

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
  String confirmedPassword = '';

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

  @action
  void validatePassword() {
    error.password = _usecase.validatePassword(password);
  }

  @action
  void validateConfirmedPassword() {
    error.confirmedPassword = _usecase.validateConfirmedPassword(password, confirmedPassword);
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

  Future<int?> register(String? path_image) async {
    error.clear();

    validateCpf();
    validateName();
    validateEmail();
    validateBirthDate();
    validatePassword();
    validateConfirmedPassword();

    if (!error.hasErrors) {
      isLoading = true;      
      int? res = await _usecase.register(path_image, cpf, name, email, dateBirth, password, null);
      print(res);

      if (res == 201) {
        isLoading = false;
      }
      return res;
    } 
    else 
    {
      return null;
    }
  }
}

class RegisterError = _RegisterErrorBase with _$RegisterError;

abstract class _RegisterErrorBase with Store {
  @observable
  String? cpf;
  
  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? dateBirth;
  
  @observable
  String? password;

  @observable
  String? confirmedPassword;

  @observable
  String? register;

  @computed
  bool get hasErrors => cpf != null || name != null || email != null || dateBirth != null ||
                        password != null || confirmedPassword != null || register != null;

  void clear() {
    cpf = null;
    name = null;
    email = null;
    dateBirth = null;
    password = null;
    confirmedPassword = null;
    register = null;
  }
}