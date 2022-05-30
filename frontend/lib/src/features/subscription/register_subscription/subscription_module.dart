import 'package:flutter_modular/flutter_modular.dart';
import '../register_subscription/data/repository/subscription_repository.dart';
import '../register_subscription/domain/model/subscription_register.dart';
import '../register_subscription/domain/repository/subscription_interface.dart';
import '../register_subscription/domain/usecase/subscription_usecase.dart';
import '../register_subscription/presentation/view/pages/register_subscription_page.dart';
import '../register_subscription/presentation/viewmodel/register_subscription_viewmodel.dart';
import '../register_provider/presentation/view/pages/register_provider_page.dart';

class SubscriptionModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => RegisterSubscriptionViewModel()),
        Bind.factory((i) => SubscriptionUseCase()),
        Bind.factory<ISubscription>((i) => SubscriptionRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const RegisterSubscriptionPage()),
    ];
}