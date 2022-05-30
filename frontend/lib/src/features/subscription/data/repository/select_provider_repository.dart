import '../../domain/model/provider.dart';
import '../../domain/repository/select_provider_interface.dart';

class SelectProviderRepository implements IListProviders {
  @override
  Future<List<Provider>> loadProviders() async {
    throw UnimplementedError();
  }
}