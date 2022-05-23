import 'package:frontend/src/features/subscription/register_provider/domain/repository/provider_interface.dart';
import 'package:frontend/src/features/subscription/register_provider/domain/model/provider_register.dart';
import 'package:frontend/src/features/subscription/register_provider/presentation/view/pages/register_provider_page.dart';

class ProviderRepository implements IProvider {
  @override
  Future<ProviderRegister> registerProvider(ProviderRegister providerRegister) async {
    throw UnimplementedError();
  }
}