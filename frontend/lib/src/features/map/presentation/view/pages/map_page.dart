import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:frontend/src/features/auth/domain/model/profile.dart';
import 'package:frontend/src/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localization/localization.dart';
import '../../viewmodel/map_viewmodel.dart';

class MapPage extends StatefulWidget {
  final Profile profile;
  const MapPage({Key? key, required this.profile}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ModularState<MapPage, MapViewModel> {
  late ThemeData _theme;
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-15.834971, -47.912889);
  final Map<String, Marker> _markers = {};
  final Set<Circle> _circles = HashSet();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      store.addMarker('iesb-sul', _center, 'IESB - Campus Sul',
          'SGAS Quadra 613/614, Via L2 Sul - Asa Sul');
      _circles.add(store.addCircle('iesb-sul-circle', _center, 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: AppColors.primary,
        title: Text('map'.i18n(), 
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight, 
            ),
          ),
        centerTitle: true,
        ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0,
        ),
        markers: _markers.values.toSet(),
        circles: _circles,
        onLongPress: (latlng) => setState(() {
          _circles.add(store.addCircle(Random().nextInt(10000).toString(), latlng, 100));
        }),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.primary,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 45.0,
              child: IconButton(
                icon: const Icon(Icons.home, color: AppColors.textLight),
                iconSize: 35,
                onPressed: () {
                  Modular.to.pushNamed('/home', arguments: widget.profile);
                }
              ),
            ),
            SizedBox(
              height: 45.0,
              child: IconButton(
                icon: const Icon(Icons.logout, color: AppColors.textLight),
                iconSize: 35,
                onPressed: () {
                  Modular.to.pushNamed('/auth');
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}