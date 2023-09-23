import 'package:conecty/pages/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:google_maps';
class MapPage extends StatefulWidget {
  Color bgColor;
  MapPage({
    Key? key,
    required this.bgColor,
  }) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> myMarkers = {};
  final _controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _controller.onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(-16.363892, -71.540470),
          zoom: 8,
        ),
        markers: myMarkers,
        onTap: (LatLng position) {
          print(position);
          Marker marker = Marker(
            // markerId: MarkerId('marker001'),
            markerId: MarkerId(myMarkers.length.toString()),
            position: position,
          );
          myMarkers.add(marker);
          setState(() {});
        },
      ),
    );
  }
}
