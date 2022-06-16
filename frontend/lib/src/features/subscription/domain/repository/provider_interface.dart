import 'package:frontend/src/features/subscription/data/dto/provider_dto.dart';

abstract class IProvider {
  Future<int> registerProvider (ProviderDto providerDto);
}
