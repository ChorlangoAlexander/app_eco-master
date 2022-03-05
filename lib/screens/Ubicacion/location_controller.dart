import 'dart:async';
import 'dart:typed_data';

import 'package:app_eco/screens/Ubicacion/helpers/image_to_bytes.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'utils/map_style.dart';

class locationController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get marker => _markers.values.toSet();
  final _markersControllers = StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _markersControllers.stream;

  final initialCameraPosition =
      const CameraPosition(target: LatLng(-0.2053476, -78.4894387), zoom: 30);

  final _locIcon = Completer<BitmapDescriptor>();

  locationController() {
    assetToBytes(
      'assets/3.png',
      width: 140,
    ).then((value) {
      final bitmap = BitmapDescriptor.fromBytes(value);
      _locIcon.complete(bitmap);
    });
  }

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng position) async {
    final id = _markers.length.toString();
    final markerId = MarkerId(_markers.length.toString());
    final icon = await _locIcon.future;
    final marker = Marker(
        markerId: markerId,
        position: position,
        icon: icon,
        onTap: () {
          _markersControllers.sink.add(id);
        });
    _markers[markerId] = marker;
    notifyListeners();
  }

  @override
  void dispose() {
    _markersControllers.close();
    super.dispose();
  }
}
