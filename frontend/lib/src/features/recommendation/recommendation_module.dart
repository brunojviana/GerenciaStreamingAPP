import 'package:flutter_modular/flutter_modular.dart';
import 'data/repository/recommendation_repository.dart';
import 'domain/repository/recommendation_interface.dart';
import 'domain/usecase/recommendation_usecase.dart';
import 'presentation/view/page/recommendation_page.dart';
import 'presentation/viewmodel/recommendation_viewmodel.dart';

class RecommendationModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => RecommendationViewModel()),
        Bind.factory((i) => RecommendationUseCase()),
        Bind.factory<IRecommendation>((i) => RecommendationRepository()),       
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/:amount', child: (_, args) => RecommendationPage(subscriptions: args.data, currentAmount: args.params['amount']))
      ];
}