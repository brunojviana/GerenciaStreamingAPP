import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../auth/domain/model/user.dart';
import '../../domain/model/userProfile.dart';
import '../../domain/usecase/home_usecase.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;
abstract class _HomeViewModelBase with Store {
  final _usecase = Modular.get<HomeUseCase>();

  Future<UserProfile> getProfile(User user) async {
    
    UserProfile res = await _usecase.getProfile(user);
    return res;
    
  }
}
