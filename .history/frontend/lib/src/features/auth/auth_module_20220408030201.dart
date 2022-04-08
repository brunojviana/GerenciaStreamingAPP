
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/auth/presentation/view/page/new_password_page.dart';
import 'package:frontend/src/features/auth/presentation/view/page/reset_password_page.dart';

import 'data/repository/login_repository.dart';
import 'domain/repository/login_interface.dart';
import 'domain/usecase/login_usecase.dart';
import 'presentation/view/page/login_page.dart';
import 'presentation/view/page/register_page.dart';
import 'presentation/viewmodel/login_viewmodel.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginViewModel()),
        Bind.factory((i) => LoginUseCase()),
        Bind.factory<ILogin>((i) => LoginRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const LoginPage()),
        ChildRoute('/register', child: (_, __) => const RegisterPage()),
        ChildRoute('/reset', child: (_, __) => const ResetPassword()),
        ChildRoute('/newpassword', child: (_, __) => const NewPassword()),
      ];
}