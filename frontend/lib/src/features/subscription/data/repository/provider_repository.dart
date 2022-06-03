import 'package:frontend/src/features/subscription/data/dto/provider_dto.dart';
import 'package:frontend/src/features/subscription/domain/repository/provider_interface.dart';

class ProviderRepository implements IProvider {
  @override
  Future<ProviderDto> registerProvider(ProviderDto provider) async {
    throw UnimplementedError();
  }
}