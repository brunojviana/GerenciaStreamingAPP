import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/auth/domain/repository/new_password_interface.dart';
import 'package:frontend/src/features/auth/domain/repository/register_interface.dart';
import 'package:frontend/src/features/auth/domain/repository/reset_password_interface.dart';
import 'package:frontend/src/features/auth/presentation/view/page/new_password_page.dart';
import 'package:frontend/src/features/auth/presentation/view/page/reset_password_page.dart';
import 'data/repository/login_repository.dart';
import 'data/repository/new_password_repository.dart';
import 'data/repository/register_repository.dart';
import 'data/repository/reset_password_repository.dart';
import 'domain/repository/login_interface.dart';
import 'domain/usecase/login_usecase.dart';
import 'domain/usecase/new_password_usecase.dart';
import 'domain/usecase/register_usecase.dart';
import 'domain/usecase/reset_password_usecase.dart';
import 'presentation/view/page/login_page.dart';
import 'presentation/view/page/register_page.dart';
import 'presentation/viewmodel/login_viewmodel.dart';
import 'presentation/viewmodel/new_password_viewmodel.dart';
import 'presentation/viewmodel/register_viewmodel.dart';
import 'presentation/viewmodel/reset_password_viewmodel.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginViewModel()),
        Bind.factory((i) => LoginUseCase()),
        Bind.factory<ILogin>((i) => LoginRepository()),
        Bind.factory((i) => ResetPasswordViewModel()),
        Bind.factory((i) => ResetPasswordUseCase()),
        Bind.factory<IReset>((i) => ResetPasswordRepository()),
        Bind.factory((i) => NewPasswordViewModel()),
        Bind.factory((i) => NewPasswordUseCase()),
        Bind.factory<IPassword>((i) => NewPasswordRepository()),
        Bind.factory((i) => RegisterViewModel()),
        Bind.factory((i) => RegisterUseCase()),
        Bind.factory<IRegister>((i) => RegisterRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const LoginPage()),
        ChildRoute('/register', child: (_, __) => const RegisterPage()),
        ChildRoute('/reset', child: (_, __) => const ResetPasswordPage()),
        ChildRoute('/newpassword', child: (_, __) => const NewPasswordPage()),
      ];
}