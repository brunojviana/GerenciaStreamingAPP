import '../model/provider_register.dart';

abstract class IProvider {
  Future<ProviderRegister> registerProvider (ProviderRegister providerRegister);
}
