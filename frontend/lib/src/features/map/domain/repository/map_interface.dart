import 'package:frontend/src/features/map/domain/model/coordinates.dart';

import '../../../auth/domain/model/user.dart';

abstract class IMap {
  Future<Coordinates> getCoordinates(User user);
}