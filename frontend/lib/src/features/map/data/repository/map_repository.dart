import 'package:frontend/src/features/auth/domain/model/user.dart';
import 'package:frontend/src/features/map/domain/model/coordinates.dart';
import '../../domain/repository/map_interface.dart';

class MapRepository implements IMap {
  @override
  Future<Coordinates> getCoordinates(User user) async {
    throw UnimplementedError();
  }
}