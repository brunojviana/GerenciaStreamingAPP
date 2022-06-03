import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../auth/domain/model/user.dart';
import '../../../subscription/domain/model/subscription.dart';
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

  @action
  void validateName() {
    error.name = _usecase.validateName(name);
  }

  @action
  void validateCategory() {
    error.category = _usecase.validateCategory(category);
  }

  Future<int?> registerContent(User user, Subscription subscription) async {
    
    error.clear();

    validateName();
    validateCategory();

    if (!error.hasErrors) {
      isLoading = true;

      int? res = await _usecase.registerContent(user, subscription.id!, subscription.provider!, name, category);
      
      return res;
    } 
    else {
      print("Erro");
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