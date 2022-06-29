import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/recommendation/recommendation_module.dart';
import 'package:frontend/src/features/subscription/data/repository/list_subscriptions_repository.dart';
import 'package:frontend/src/features/subscription/domain/repository/list_subscriptions_interface.dart';
import 'package:frontend/src/features/subscription/domain/usecase/list_subscriptions_usecase.dart';
import '../content/content_module.dart';
import '../map/map_module.dart';
import '../profile/profile_module.dart';
import '../spending/spending_module.dart';
import '../subscription/subscription_module.dart';
import 'data/repository/home_repository.dart';
import 'domain/repository/profile_interface.dart';
import 'domain/usecase/home_usecase.dart';
import 'presentation/view/pages/home_page.dart';
import 'presentation/viewmodel/home_viewmodel.dart';
import '../chatbot/chatboat_module.dart';
class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => HomeViewModel()),
        Bind.factory((i) => HomeUseCase()),
        Bind.factory((i) => ListSubscriptionsUseCase()),
        Bind.factory<IListSubscriptions>((i) => ListSubsciptionsRepository()),
        Bind.factory<IProfile>((i) => HomeRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage(profile: args.data)),
        ModuleRoute('/subscriptions', module: SubscriptionModule()),
        ModuleRoute('/map', module: MapModule()),
        ModuleRoute('/movies', module: ContentModule()),
        ModuleRoute('/otherContents', module: ContentModule()),
        ModuleRoute('/profile', module: ProfileModule()), 
        ModuleRoute('/spendings', module: SpendingModule()),
        ModuleRoute('/recommendations', module: RecommendationModule()),
        ModuleRoute('/chatbot', module: ChatBotModule()),
      ];
}