import 'package:flutter_modular/flutter_modular.dart';
import 'data/repository/content_detail_repository.dart';
import 'data/repository/list_contents_repository.dart';
import 'domain/repository/content_detail_interface.dart';
import 'domain/repository/list_contents_interface.dart';
import 'domain/usecase/content_detail.dart';
import 'domain/usecase/list_contents_usecase.dart';
import 'presentation/view/pages/content_detail_page.dart';
import 'presentation/view/pages/list_contents_page.dart';
import 'presentation/viewmodel/content_detail_viewmodel.dart';
import 'presentation/viewmodel/list_contents_viewmodel.dart';

class ContentModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => ListContentsViewModel()),
        Bind.factory((i) => ListContentsUseCase()),
        Bind.factory<IListContents>((i) => ListContentsRepository()),
        Bind.factory((i) => ContentDetailViewModel()),
        Bind.factory((i) => ContentDetailUseCase()),
        Bind.factory<IContentDetail>((i) => ContentDetailRepository())
        ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const ListContentsPage()),
        ChildRoute('/detailcontent', child: (_, args) => ContentDetailPage(content: args.data)),
        //ChildRoute('/newcontent', child: (_, __) => const RegisterContentPage()),
        //ChildRoute('/selectsubscription', child: (_, __) => const SelectSubscriptionPage())
      ];
}