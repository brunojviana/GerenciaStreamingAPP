import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/subscription/subscription_module.dart';
import 'data/repository/content_detail_repository.dart';
import 'data/repository/edit_content_repository.dart';
import 'data/repository/list_contents_repository.dart';
import 'data/repository/register_content_repository.dart';
import 'data/repository/select_subscription_repository.dart';
import 'domain/repository/content_detail_interface.dart';
import 'domain/repository/edit_content_interface.dart';
import 'domain/repository/list_contents_interface.dart';
import 'domain/repository/register_content_interface.dart';
import 'domain/repository/select_subscription_interface.dart';
import 'domain/usecase/content_detail_usecase.dart';
import 'domain/usecase/edit_content_usecase.dart';
import 'domain/usecase/list_contents_usecase.dart';
import 'domain/usecase/register_content_usecase.dart';
import 'domain/usecase/select_subscription_usecase.dart';
import 'presentation/view/pages/content_detail_page.dart';
import 'presentation/view/pages/edit_content_page.dart';
import 'presentation/view/pages/list_contents_page.dart';
import 'presentation/view/pages/register_content_page.dart';
import 'presentation/view/pages/select_subscription_page.dart';
import 'presentation/viewmodel/content_detail_viewmodel.dart';
import 'presentation/viewmodel/edit_content_viewmodel.dart';
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
        Bind.factory<IRegisterContent>((i) => RegisterContentRepository()),
        Bind.factory((i) => EditContentViewModel()),
        Bind.factory((i) => EditContentUseCase()),
        Bind.factory<IEditContent>((i) => EditContentRepository()),
        ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/:category', child: (_, args) => ListContentsPage(profile: args.data, category: args.params['category'])),
        ChildRoute('/detailcontent', child: (_, args) => ContentDetailPage(content: args.data)),
        ChildRoute('/selectsubscription', child: (_, args) => SelectSubscriptionPage(profile: args.data)),
        ModuleRoute('/newsubscription', module: SubscriptionModule()),
        ChildRoute('/newcontent', child: (_, args) => RegisterContentPage(subscription: args.data)),
        ChildRoute('/editcontent', child: (_, args) => EditContentPage(content: args.data))
      ];
}