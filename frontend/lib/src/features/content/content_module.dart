import 'package:flutter_modular/flutter_modular.dart';
import '../subscription/presentation/view/pages/select_provider.dart';
import 'data/repository/content_detail_repository.dart';
import 'data/repository/list_contents_repository.dart';
import 'data/repository/register_content_repository.dart';
import 'data/repository/select_subscription_repository.dart';
import 'domain/repository/content_detail_interface.dart';
import 'domain/repository/list_contents_interface.dart';
import 'domain/repository/register_content_interface.dart';
import 'domain/repository/select_subscription_interface.dart';
import 'domain/usecase/content_detail_usecase.dart';
import 'domain/usecase/list_contents_usecase.dart';
import 'domain/usecase/register_content_usecase.dart';
import 'domain/usecase/select_subscription_usecase.dart';
import 'presentation/view/pages/content_detail_page.dart';
import 'presentation/view/pages/list_contents_page.dart';
import 'presentation/view/pages/register_content_page.dart';
import 'presentation/view/pages/select_subscription_page.dart';
import 'presentation/viewmodel/content_detail_viewmodel.dart';
import 'presentation/viewmodel/list_contents_viewmodel.dart';
import 'presentation/viewmodel/register_content_viewmodel.dart';
import 'presentation/viewmodel/select_subscription_viewmodel.dart';

class ContentModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => ListContentsViewModel()),
        Bind.factory((i) => ListContentsUseCase()),
        Bind.factory<IListContents>((i) => ListContentsRepository()),
        Bind.factory((i) => ContentDetailViewModel()),
        Bind.factory((i) => ContentDetailUseCase()),
        Bind.factory<IContentDetail>((i) => ContentDetailRepository()),
        Bind.factory((i) => SelectSubscriptionViewModel()),
        Bind.factory((i) => SelectSubscriptionUseCase()),
        Bind.factory<ISelectSubscription>((i) => SelectSubscriptionRepository()),
        Bind.factory((i) => RegisterContentViewModel()),
        Bind.factory((i) => RegisterContentUseCase()),
        Bind.factory<IRegisterContent>((i) => RegisterContentRepository())
        ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const ListContentsPage()),
        ChildRoute('/detailcontent', child: (_, args) => ContentDetailPage(content: args.data)),
        ChildRoute('/selectsubscription', child: (_, __) => const SelectSubscriptionPage()),
        ChildRoute('/newsubscription', child: (_, __) => const SelectProviderPage()),
        ChildRoute('/newcontent', child: (_, args) => RegisterContentPage(subscription: args.data)),
        
      ];
}