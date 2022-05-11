import 'package:flutter_modular/flutter_modular.dart';
import 'features/auth/auth_module.dart';
import 'features/home/home_module.dart';
import 'features/map/map_module.dart';
import 'features/onboarding/onboarding_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: OnboardingModule()),  
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/map', module: MapModule()),
      ];
}