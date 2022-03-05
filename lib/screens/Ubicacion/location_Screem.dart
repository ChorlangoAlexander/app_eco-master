import 'package:app_eco/screens/Ubicacion/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class locationScreem extends StatefulWidget {
  locationScreem({Key? key}) : super(key: key);

  @override
  State<locationScreem> createState() => _locationScreemState();
}

class _locationScreemState extends State<locationScreem> {
  final _controller = locationController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EcoMapa'), centerTitle: true, actions: [
        InkWell(
          onTap: () {},
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Icon(Icons.settings)),
        ),
      ]),
      body: GoogleMap(
        markers: _controller.marker,
        onMapCreated: _controller.onMapCreated,
        initialCameraPosition: _controller.initialCameraPosition,
        //myLocationButtonEnabled: true,
        //mapType: MapType.normal,
        onTap: _controller.onTap,
      ),
    );
  }
}
