import 'package:flutter_modular/flutter_modular.dart';
import '../map/map_module.dart';
import 'data/repository/home_repository.dart';
import 'domain/repository/profile_interface.dart';
import 'domain/usecase/home_usecase.dart';
import 'presentation/view/pages/home_page.dart';
import 'presentation/viewmodel/home_viewmodel.dart';
import '../subscription/register_provider/provider_module.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => HomeViewModel()),
        Bind.factory((i) => HomeUseCase()),
        Bind.factory<IProfile>((i) => HomeRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
        ModuleRoute('/profile', module: MapModule()),
        ModuleRoute('/subscriptions', module: ProviderModule()), 
        ModuleRoute('/movies', module: MapModule()),
        ModuleRoute('/otherContents', module: MapModule()),
        ModuleRoute('/spendings', module: MapModule()),
        ModuleRoute('/recommendations', module: MapModule()),
        ModuleRoute('/map', module: MapModule()),
        ModuleRoute('/notifications', module: MapModule()),
        ModuleRoute('/map', module: MapModule()),

      ];
}