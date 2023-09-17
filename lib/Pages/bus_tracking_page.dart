import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusTrackingPage extends StatefulWidget {
  const BusTrackingPage({Key? key}) : super(key: key);

  @override
  State<BusTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<BusTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Track Bus",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: const Center(
        child: Text("The Flutter Way!"),
      ),
    );
  }
}
