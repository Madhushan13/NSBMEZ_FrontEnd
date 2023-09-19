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

// ignore: camel_case_types
class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                onTap(0);
              },
              icon: Icon(
                Icons.home,
                color: currentIndex == 0 ? Colors.blue : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                onTap(1);
              },
              icon: Icon(
                Icons.event,
                color: currentIndex == 1 ? Colors.blue : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                onTap(2);
              },
              icon: Icon(
                Icons.payment,
                color: currentIndex == 2 ? Colors.blue : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                onTap(3);
              },
              icon: Icon(
                Icons.track_changes,
                color: currentIndex == 3 ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
