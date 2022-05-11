import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/map/domain/model/coordinates.dart';
import '../../../auth/domain/model/user.dart';
import '../repository/map_interface.dart';


class MapUseCase {
  final repository = Modular.get<IMap>();

  Future<Coordinates> getCoordinates(User user) async {
    return repository.getCoordinates(user);
  }
}