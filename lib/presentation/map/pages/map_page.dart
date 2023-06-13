import 'package:chatapp/presentation/map/widgets/google_map.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MapView();
  }
}

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: GoogleMapBody(),
      ),
    );
  }
}
