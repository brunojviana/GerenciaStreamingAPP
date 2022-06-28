import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/domain/model/profile.dart';
import '../../../subscription/domain/model/subscription.dart';
import '../../domain/usecase/recommendation_usecase.dart';

part 'recommendation_viewmodel.g.dart';

class RecommendationViewModel = _RecommendationViewModelBase with _$RecommendationViewModel;
abstract class _RecommendationViewModelBase with Store {
  final error = RecommendationError();
  final _usecase = Modular.get<RecommendationUseCase>();

  @observable
  String amount = '';

  @observable
  bool isLoading = false;

  @action
  void validateAmount() {
    error.amount = _usecase.validateAmount(amount);
  }

  Future<List<Subscription>?> calculateSubset() async {
    
    error.clear();
    validateAmount();
    
    if (!error.hasErrors) {
      isLoading = true;
      List<Subscription>? res = await _usecase.calculateSubset(double.parse(amount));
      return res;
    } 
    else {
      print("Erro");
      return null;
    }
  }

  Future<double> calculateCurrentAmount(List<Subscription> subscriptions) async {
    
    double currentAmount = 0;
    
    if (subscriptions.isNotEmpty)
    {
      for (int i=0; i<subscriptions.length; i++)
      {
        currentAmount = currentAmount + subscriptions[i].price!;
      }
      return currentAmount;
    }
    else
    {
      return 0;
    }
  }

  Future<Subscription?> calculateMostUsed(List<Subscription> subscriptions) async {
    
    if (subscriptions.isNotEmpty)
    {
      Subscription mostUsed = subscriptions[0];

      for (int i=0; i<subscriptions.length; i++)
      {
        if (subscriptions[i].useTime! > mostUsed.useTime!)
        {
          mostUsed = subscriptions[i];
        }
        
      }
      return mostUsed;
    }
    else
    {
      return null;
    }
  }  

  Future<Subscription?> calculateLessUsed(List<Subscription> subscriptions) async {
    
    if (subscriptions.isNotEmpty)
    {
      Subscription lessUsed = subscriptions[0];

      for (int i=0; i<subscriptions.length; i++)
      {
        if (subscriptions[i].useTime! < lessUsed.useTime!)
        {
          lessUsed = subscriptions[i];
        }
      }
      return lessUsed;
    }
    else
    {
      return null;
    }
  }

  Future<double> calculateSpendingPerHour(Subscription subscription) async {
    return subscription.price! / subscription.useTime!;
  }

  Future<Profile> getSavedUser() async {
    SharedPreferences _user = await SharedPreferences.getInstance();
    String? jsonUser = _user.getString("profile");
    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    Profile _profile = Profile.fromJson(mapUser);
    return _profile;    
  }
  
}

class RecommendationError = _RecommendationErrorBase with _$RecommendationError;

abstract class _RecommendationErrorBase with Store {
  @observable
  String? amount;

  @computed
  bool get hasErrors => amount != null;

  void clear() {
    amount = null;
  }
}