import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapSection extends StatelessWidget {
  const MapSection({
    super.key, required this.location,
  });
  final String location;

  @override
  Widget build(BuildContext context) {
    List<String> coordinates = location.split(',');
    double latitude = double.parse(coordinates[0].trim()); 
    double longitude = double.parse(coordinates[1].trim()); 
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(latitude, longitude), 
        initialZoom: 15.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(latitude, longitude), 
              child:  Icon(
                Icons.location_on,
                color: Colors.red,
                size: 40,
              ), 
            ),
          ],
        ),
      ],
    );
  }
}
