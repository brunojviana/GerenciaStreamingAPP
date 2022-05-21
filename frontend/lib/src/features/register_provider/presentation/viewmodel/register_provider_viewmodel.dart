import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:frontend/src/features/register_provider/domain/usecase/provider_usecase.dart';

part 'register_provider_viewmodel.g.dart';

class RegisterProviderViewModel = _RegisterProviderViewModelBase with _$RegisterProviderViewModel;
abstract class _RegisterProviderViewModelBase with Store {
  
  final error = RegisterError();
  final _usecase = Modular.get<RegisterProviderUseCase>();

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

  Future<int?> registerProvider() async {
    
    error.clear();
    validateName();
    validateCategory();

    if (!error.hasErrors) {
      isLoading = true;
    } 
    else {
      print("Erro");
      return null;
    }

  }
}

class RegisterError = _RegisterErrorBase with _$RegisterError;

abstract class _RegisterErrorBase with Store {

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