import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/subscription/domain/model/subscription.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/domain/model/profile.dart';
import '../../domain/usecase/edit_subscription_usecase.dart';

part 'edit_subscription_viewmodel.g.dart';

class EditSubscriptionViewModel = _EditSubscriptionViewModelBase with _$EditSubscriptionViewModel;
abstract class _EditSubscriptionViewModelBase with Store {
  
  final error = EditSubscriptionError();
  final _usecase = Modular.get<EditSubscriptionUseCase>();

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

  Future<Subscription?> editSubscription(Subscription sub) async {
    print(screens);
    error.clear();

    validateDate();
    validateValue();
    validateScreens();
    validatePayment();
    validateResolution();

    print(screens);

    if (!error.hasErrors) {
      isLoading = true;

      List ret = date.split('/');
      String dateFormat;
      dateFormat = "${ret[2]}-${ret[1]}-${ret[0]}";

      var telas = int.parse(screens);
      var preco = double.parse(value);

      print(telas);

      sub.signatureDate = dateFormat;
      sub.screens = telas;
      sub.maxResolution = resolution;
      sub.price = preco;
      sub.periodPayment = payment;
      
      Subscription? res = await _usecase.editSubscription(sub);
      return res;
    } 
    else {
      return null;
    }
  }
}

class EditSubscriptionError = _EditSubscriptionErrorBase with _$EditSubscriptionError;

abstract class _EditSubscriptionErrorBase with Store {
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
  bool get hasErrors => date != null || value != null || screens != null 
                        || payment != null || resolution != null ;

  void clear() {
    date = null;
    value = null;
    screens = null;
    payment = null;
    resolution = null;
  }
}