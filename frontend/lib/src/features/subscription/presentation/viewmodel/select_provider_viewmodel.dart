import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../domain/model/provider.dart';
import '../../domain/usecase/select_provider_usecase.dart';

part 'select_provider_viewmodel.g.dart';

class SelectProviderViewModel = _SelectProviderViewModelBase with _$SelectProviderViewModel;
abstract class _SelectProviderViewModelBase with Store {
  final _usecase = Modular.get<SelectProviderUseCase>();

  List<Provider> listProviders = [];

    Future<List<Provider>> loadProviders() async {
    
    List<Provider> res = await _usecase.loadProviders();
    return res;
    }
}