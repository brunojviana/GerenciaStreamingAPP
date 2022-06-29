import 'package:flutter_modular/flutter_modular.dart';
import 'features/auth/auth_module.dart';
import 'features/chatbot/chatboat_module.dart';
import 'features/content/content_module.dart';
import 'features/home/home_module.dart';
import 'features/map/map_module.dart';
import 'features/onboarding/onboarding_module.dart';
import 'features/profile/profile_module.dart';
import 'features/recommendation/recommendation_module.dart';
import 'features/spending/spending_module.dart';
import 'features/subscription/subscription_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: OnboardingModule()),  
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/subscriptions', module: SubscriptionModule()),
        ModuleRoute('/map', module: MapModule()),
        ModuleRoute('/contents', module: ContentModule()),
        ModuleRoute('/profile', module: ProfileModule()),
        ModuleRoute('/spendings', module: SpendingModule()),
        ModuleRoute('/recommendations', module: RecommendationModule()),
        ModuleRoute('/chatbot', module: ChatBotModule()),
  ];
}