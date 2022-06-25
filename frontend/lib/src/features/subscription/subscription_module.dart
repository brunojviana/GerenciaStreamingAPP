import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/subscription/domain/repository/list_subscriptions_interface.dart';
import 'data/repository/edit_subscription_repository.dart';
import 'data/repository/list_subscriptions_repository.dart';
import 'data/repository/provider_repository.dart';
import 'data/repository/select_provider_repository.dart';
import 'data/repository/subscription_detal_repository.dart';
import 'data/repository/subscription_repository.dart';
import 'domain/repository/edit_subscription_interface.dart';
import 'domain/repository/provider_interface.dart';
import 'domain/repository/select_provider_interface.dart';
import 'domain/repository/subscription_detail_interface.dart';
import 'domain/repository/register_subscription_interface.dart';
import 'domain/usecase/edit_subscription_usecase.dart';
import 'domain/usecase/list_subscriptions_usecase.dart';
import 'domain/usecase/register_provider_usecase.dart';
import 'domain/usecase/select_provider_usecase.dart';
import 'domain/usecase/subscription_detail_usecase.dart';
import 'domain/usecase/register_subscription_usecase.dart';
import 'presentation/view/pages/edit_subscription_page.dart';
import 'presentation/view/pages/list_subscriptions_page.dart';
import 'presentation/view/pages/register_provider_page.dart';
import 'presentation/view/pages/register_subscription_page.dart';
import 'presentation/view/pages/select_provider.dart';
import 'presentation/view/pages/subscription_detail.dart';
import 'presentation/viewmodel/edit_subscription_viewmodel.dart';
import 'presentation/viewmodel/list_subscriptions_viewmodel.dart';
import 'presentation/viewmodel/register_provider_viewmodel.dart';
import 'presentation/viewmodel/register_subscription_viewmodel.dart';
import 'presentation/viewmodel/select_provider_viewmodel.dart';
import 'presentation/viewmodel/subscription_detail_viewmodel.dart';

class SubscriptionModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => ListSubscriptionsViewModel()),
        Bind.factory((i) => ListSubscriptionsUseCase()),
        Bind.factory<IListSubscriptions>((i) => ListSubsciptionsRepository()),
        Bind.factory((i) => SelectProviderViewModel()),
        Bind.factory((i) => SelectProviderUseCase()),
        Bind.factory<IListProviders>((i) => SelectProviderRepository()),
        Bind.factory((i) => RegisterProviderViewModel()),
        Bind.factory((i) => RegisterProviderUseCase()),
        Bind.factory<IProvider>((i) => ProviderRepository()),
        Bind.factory((i) => RegisterSubscriptionViewModel()),
        Bind.factory((i) => SubscriptionUseCase()),
        Bind.factory<ISubscription>((i) => SubscriptionRepository()),
        Bind.factory((i) => SubscriptionDetailViewModel()),
        Bind.factory((i) => SubscriptionDetailUseCase()),
        Bind.factory<ISubscriptionDetail>((i) => SubscriptionDetailRepository()),
        Bind.factory((i) => EditSubscriptionViewModel()),
        Bind.factory((i) => EditSubscriptionUseCase()),
        Bind.factory<IEditSubscription>((i) => EditSubscriptionRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => ListSubscriptionsPage(profile: args.data)),
        ChildRoute('/selectprovider', child: (_, args) => SelectProviderPage(providers: args.data)),
        ChildRoute('/newprovider', child: (_, args) => RegisterProviderPage(profile: args.data)),
        ChildRoute('/newsubscription', child: (_, args) => 
          RegisterSubscriptionPage(provider: args.data)),
        ChildRoute('/detailsubscription', child: (_, args) => 
          SubscriptionDetailPage(subscription: args.data)),
        ChildRoute('/editsubscription', child: (_, args) => 
          EditSubscriptionPage(subscription: args.data)),
      ];
}