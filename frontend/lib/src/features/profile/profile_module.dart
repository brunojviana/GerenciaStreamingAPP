import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/profile/domain/repository/change_password_interface.dart';
import 'data/repository/change_password_repository.dart';
import 'data/repository/user_profile_repository.dart';
import 'domain/repository/user_profile_inteface.dart';
import 'domain/usecase/change_password_usecase.dart';
import 'domain/usecase/user_profile_usecase.dart';
import 'presentation/view/pages/change_password_page.dart';
import 'presentation/view/pages/user_profile_page.dart';
import 'presentation/viewmodel/change_password_viewmodel.dart';
import 'presentation/viewmodel/user_profile_viewmodel.dart';

class ProfileModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => UserProfileViewModel()),
        Bind.factory((i) => UserProfileUseCase()),
        Bind.factory<IEditProfile>((i) => UserProfileRepository()),    
        Bind.factory((i) => ChangePasswordViewModel()),
        Bind.factory((i) => ChangePasswordUseCase()),
        Bind.factory<IChangePassword>((i) => ChangePasswordRepository()),   
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => UserProfilePage(profile: args.data)),
        ChildRoute('/changePassword', child: (_, args) => ChangePasswordPage(profile: args.data))
      ];
}