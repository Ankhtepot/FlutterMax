import 'package:favorite_places/data/data.dart';
import 'package:favorite_places/general/navigation_helper.dart';
import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = defaultLocation,
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedPosition;

  @override
  Widget build(BuildContext context) {
    PlaceLocation location = widget.location;
    double lat = location.latitude;
    double lng = location.longitude;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelecting ? 'Pick your location' : 'Your location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                navigatePop(context, data: _pickedPosition);
              },
            ),
        ],
      ),
      body: Center(
        child: GoogleMap(
          onTap: !widget.isSelecting ? null : (position) => {setState(() => _pickedPosition = position)},
          initialCameraPosition: CameraPosition(
            target: LatLng(lat, lng),
            zoom: 16,
          ),
          markers: (_pickedPosition == null && widget.isSelecting)
              ? {}
              : {
                  Marker(
                    markerId: const MarkerId('m1'),
                    position: _pickedPosition ?? LatLng(lat, lng),
                  ),
                },
        ),
      ),
    );
  }
}
