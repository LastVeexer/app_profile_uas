import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  LatLng _currentPosition = LatLng(-6.200000, 106.816666); // Default to Jakarta

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    print('Requesting location permission...');
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('Location permission granted.');
      // Note: In a real app, you should use a location plugin to get the current location
    } else {
      print('Location permission denied.');
      // Handle permission denial
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    print('Map created');
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    print('Building MapScreen widget...');
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _currentPosition,
          zoom: 10.0,
        ),
      ),
    );
  }
}
