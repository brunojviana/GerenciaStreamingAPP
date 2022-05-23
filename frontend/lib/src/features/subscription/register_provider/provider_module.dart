import 'package:flutter_modular/flutter_modular.dart';
import '../register_provider/data/dto/provider_dto.dart';
import '../register_provider/data/repository/provider_repository.dart';
import '../register_provider/domain/model/provider_register.dart';
import '../register_provider/domain/repository/provider_interface.dart';
import '../register_provider/domain/usecase/provider_usecase.dart';
import '../register_provider/presentation/view/pages/register_provider_page.dart';
import '../register_provider/presentation/viewmodel/register_provider_viewmodel.dart';
import '../register_subscription/subscription_module.dart';

class ProviderModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => RegisterProviderViewModel()),
        Bind.factory((i) => RegisterProviderUseCase()),
        Bind.factory<IProvider>((i) => ProviderRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const RegisterProviderPage()),
        ModuleRoute('/subscription', module: SubscriptionModule()),
      ];
}