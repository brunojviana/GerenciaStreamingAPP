import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/map/domain/model/coordinates.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import '../../../../theme.dart';
import '../../../auth/domain/model/user.dart';
import '../../domain/usecase/map_usecase.dart';

part 'map_viewmodel.g.dart';

class MapViewModel = _MapViewModelBase with _$MapViewModel;
abstract class _MapViewModelBase with Store {
  final _usecase = Modular.get<MapUseCase>();

  Marker addMarker(String id, LatLng position, String title, String snippet) {
    final newMarker = Marker(
        markerId: MarkerId(id),
        position: position,
        infoWindow: InfoWindow(
          title: title,
          snippet: snippet,
        ));
    return newMarker;
  }

  Circle addCircle(String id, LatLng point, double radius) {
    final circle = Circle(
        circleId: CircleId(id),
        center: point,
        radius: radius,
        fillColor: AppColors.secondary,
        strokeWidth: 3,
        strokeColor: AppColors.accent);
    return circle;
  }
  
  Future<Coordinates> getCoordinates(User user) async {
    
    Coordinates res = await _usecase.getCoordinates(user);
    return res;
    
  }  
}
