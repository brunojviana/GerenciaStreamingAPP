import 'package:flutter_modular/flutter_modular.dart';
import '../auth/auth_module.dart';
import '../auth/presentation/view/page/login_page.dart';
import 'presentation/view/page/onboarding_page.dart';
import 'presentation/viewmodel/onboarding_viewmodel.dart';

class OnboardingModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => OnboardingViewModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => OnboardingPage()),
        //ChildRoute('/login', child: (_, __) => const LoginPage())
        ModuleRoute('/auth', module: AuthModule())
      ];
}