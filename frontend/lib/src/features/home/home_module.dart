import 'package:flutter_modular/flutter_modular.dart';
import '../content/content_module.dart';
import '../map/map_module.dart';
import '../profile/profile_module.dart';
import '../subscription/subscription_module.dart';
import 'data/repository/home_repository.dart';
import 'domain/repository/profile_interface.dart';
import 'domain/usecase/home_usecase.dart';
import 'presentation/view/pages/home_page.dart';
import 'presentation/viewmodel/home_viewmodel.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => HomeViewModel()),
        Bind.factory((i) => HomeUseCase()),
        Bind.factory<IProfile>((i) => HomeRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage(profile: args.data)),
        ModuleRoute('/subscriptions', module: SubscriptionModule()),
        ModuleRoute('/map', module: MapModule()),
        ModuleRoute('/movies', module: ContentModule()),
        ModuleRoute('/otherContents', module: ContentModule()),
        //ModuleRoute('/profile', module: ProfileModule()), 
        //ModuleRoute('/spendings', module: SpendingsModule()),
        //ModuleRoute('/recommendations', module: RecommendationsModule()),
        //ModuleRoute('/notifications', module: NotificationsModule()),
      ];
}