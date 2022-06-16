import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/map/presentation/viewmodel/map_viewmodel.dart';
import 'data/repository/map_repository.dart';
import 'domain/repository/map_interface.dart';
import 'domain/usecase/map_usecase.dart';
import 'presentation/view/pages/map_page.dart';

class MapModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => MapViewModel()),
        Bind.factory((i) => MapUseCase()),
        Bind.factory<IMap>((i) => MapRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => MapPage(profile: args.data)),
      ];
}