import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:frontend/src/features/subscription/domain/usecase/register_subscription_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/domain/model/profile.dart';
import '../../domain/model/subscription.dart';
import '../../domain/usecase/list_subscriptions_usecase.dart';

part 'register_subscription_viewmodel.g.dart';

class RegisterSubscriptionViewModel = _RegisterSubscriptionViewModelBase with _$RegisterSubscriptionViewModel;
abstract class _RegisterSubscriptionViewModelBase with Store {
  
  final error = RegisterSubscriptionError();
  final _usecase = Modular.get<SubscriptionUseCase>();
  final _usecaseSubs = Modular.get<ListSubscriptionsUseCase>();

  @observable
  String date = '';

  @observable
  String value = '';

  @observable
  String screens = '';

  @observable
  String payment = '';

  @observable
  String resolution = '';

  @observable
  bool isLoading = false;

  int content = 0;
  double useTime = 0.15;
  int status = 1;

  @action
  void validateDate() {
    error.date = _usecase.validateDate(date);
  }

  @action
  void validateValue() {
    error.value = _usecase.validateValue(value);
  }

  @action
  void validateScreens() {
    error.screens = _usecase.validateScreens(screens);
  }

  @action
  void validatePayment() {
    error.payment = _usecase.validatePayment(payment);
  }

  @action
  void validateResolution() {
    error.resolution = _usecase.validateResolution(resolution);
  }
  
  Future<Profile> getSavedUser() async {
    SharedPreferences _user = await SharedPreferences.getInstance();
    String? jsonUser = _user.getString("profile");
    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    Profile _profile = Profile.fromJson(mapUser);
    return _profile;    
  }

  Future<Subscription?> registerSubscription(int userId, int idProvider) async {
    
    error.clear();

    validateDate();
    validateValue();
    validateScreens();
    validatePayment();
    validateResolution();

    if (!error.hasErrors) {
      isLoading = true;

      List ret = date.split('/');
      String dateFormat;
      dateFormat = "${ret[2]}-${ret[1]}-${ret[0]}";

      var telas = int.parse(screens);
      var preco = double.parse(value);

      Subscription? res = await _usecase.registerSubscription(
        userId, 
        idProvider, 
        dateFormat, 
        preco, 
        payment, 
        telas, 
        resolution, 
        content,
        useTime,
        status
      );
      
      if (res != null) {
        return res;
      }

      return null;
    } 
    else {
      return null;
    }
  }

  Future<List<Subscription>> getSubs(int idUser) async {
    List<Subscription> res = await _usecaseSubs.loadSubs(idUser);
    return res;
  }
}

class RegisterSubscriptionError = _RegisterSubscriptionErrorBase with _$RegisterSubscriptionError;

abstract class _RegisterSubscriptionErrorBase with Store {
  @observable
  String? date;
  
  @observable
  String? value;

  @observable
  String? screens;

  @observable
  String? payment;

  @observable
  String? resolution;

  @computed
  bool get hasErrors => date != null || value != null || screens != null || payment != null || resolution != null ;

  void clear() {
    date = null;
    value = null;
    screens = null;
    payment = null;
    resolution = null;
  }
}