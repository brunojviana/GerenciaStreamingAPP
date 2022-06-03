import 'package:flutter_modular/flutter_modular.dart';
import '../model/provider.dart';
import '../repository/select_provider_interface.dart';

class SelectProviderUseCase {
  final repository = Modular.get<IListProviders>();

  Future<List<Provider>> loadProviders() {
    return repository.loadProviders();
  }
}