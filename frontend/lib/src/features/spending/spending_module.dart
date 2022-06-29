import 'package:flutter_modular/flutter_modular.dart';
import 'data/repository/spending_history_repository.dart';
import 'domain/repository/spending_history_interface.dart';
import 'domain/usecase/spending_history_usecase.dart';
import 'presentation/view/page/spending_history_page.dart';
import 'presentation/viewmodel/spending_history_viewmodel.dart';

class SpendingModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => SpendingHistoryViewModel()),
        Bind.factory((i) => SpendingHistoryUseCase()),
        Bind.factory<ISpendingHistory>((i) => SpendingHistoryRepository()),       
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => SpendingHistoryPage(calendars: args.data))
      ];
}