import 'dart:convert';

import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/utils/permission_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapBody extends StatefulWidget {
  const GoogleMapBody({super.key});

  @override
  State<GoogleMapBody> createState() => _GoogleMapBodyState();
}

class _GoogleMapBodyState extends State<GoogleMapBody> {
  late GoogleMapController _controller;
  Set<Marker> markers = {};

  Future<void> _getCurrentLocation() async {
    try {
      await PermissionUtils.getCurrentLocation().then((position) {
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 16.0,
            ),
          ),
        );
        markers.clear();
        markers.add(
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: LatLng(position.latitude, position.longitude),
          ),
        );
        setState(() {});
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void _sendMyLocation() {
    Navigator.pop(
        context, {"currentLocation": jsonEncode(markers.first.position)});
  }

  @override
  void initState() {
    super.initState();
    (() async {
      await _getCurrentLocation();
    })();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(36)),
              child: Align(
                alignment: Alignment.bottomRight,
                heightFactor: 0.3,
                widthFactor: 2.5,
                child: GoogleMap(
                  initialCameraPosition: _kInitialCamera,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                  },
                  markers: markers,
                  // onCameraIdle: () {
                  //   setState(() {});
                  // },
                  onTap: (LatLng latPress) {
                    markers.clear();
                    markers.add(
                      Marker(
                        markerId: const MarkerId('currentLocation'),
                        position: LatLng(latPress.latitude, latPress.longitude),
                      ),
                    );
                    setState(() {});
                  },
                  // onCameraMove: (CameraPosition cameraPosition) {
                  //   markers.clear();
                  //   markers.add(
                  //     Marker(
                  //       markerId: const MarkerId('currentLocation'),
                  //       position: LatLng(cameraPosition.target.latitude,
                  //           cameraPosition.target.longitude),
                  //     ),
                  //   );
                  // },
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            TextButton(
                onPressed: _sendMyLocation, child: Text("Send my location")),
          ],
        )
      ],
    );
  }

  static const CameraPosition _kInitialCamera =
      CameraPosition(target: LatLng(33.6844, 73.0499));
}
