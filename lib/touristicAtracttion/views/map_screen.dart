import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String name;

  const MapScreen({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.name,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  late CameraPosition _initialPosition;
  late Marker _marker;

  @override
  void initState() {
    super.initState();
    _initialPosition = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 18,
    );
    _marker = Marker(
      markerId: const MarkerId('site_marker'),
      position: LatLng(widget.latitude, widget.longitude),
      infoWindow: InfoWindow(title: widget.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        onMapCreated: (controller) {
          mapController = controller;
        },
        mapType: MapType.normal,
        markers: {_marker},
      ),
    );
  }
}
