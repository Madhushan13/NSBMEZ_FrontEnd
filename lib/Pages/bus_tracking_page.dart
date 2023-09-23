import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'Home_widget.dart';
import 'chat_page.dart';
import 'home_page.dart';

class BusTrackingPage extends StatefulWidget {
  const BusTrackingPage({Key? key}) : super(key: key);

  @override
  State<BusTrackingPage> createState() => _BusTrackingPageState();
}

class _BusTrackingPageState extends State<BusTrackingPage> {
  Completer<GoogleMapController> _googleMapController = Completer();
  CameraPosition? _cameraPosition;
  Location? _location;
  LocationData? _currentLocation;

  // Add variables for the search bar and dropdown
  TextEditingController _searchController = TextEditingController();
  List<String> _locations = ["Location 1", "Location 2", "Location 3"];
  String? _selectedLocation;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    _location = Location();
    _cameraPosition = CameraPosition(
      target: LatLng(0, 0),
      zoom: 15,
    );
    _initLocation();
  }

  _initLocation() {
    _location?.getLocation().then((location) {
      _currentLocation = location;
    });
    _location?.onLocationChanged.listen((newLocation) {
      _currentLocation = newLocation;
      moveToPosition(LatLng(
          _currentLocation?.latitude ?? 0, _currentLocation?.longitude ?? 0));
    });
  }

  moveToPosition(LatLng latLng) async {
    GoogleMapController mapController = await _googleMapController.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 15)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Tracking"),
      ),
      body: _buildBody(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatDialog()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: "Search for a Bus",
              suffixIcon: DropdownButton<String>(
                value: _selectedLocation,
                items: _locations.map((String Bus) {
                  return DropdownMenuItem<String>(
                    value: Bus,
                    child: Text(Bus),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLocation = newValue;
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: _getMap(),
        ),
      ],
    );
  }

  Widget _getMarker() {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 3),
            spreadRadius: 4,
            blurRadius: 6,
          ),
        ],
      ),
      child: ClipOval(child: Image.asset("assets/images/NSBMEZ Black.png")),
    );
  }

  Widget _getMap() {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _cameraPosition!,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            if (!_googleMapController.isCompleted) {
              _googleMapController.complete(controller);
            }
          },
        ),
        Positioned.fill(
          child: Align(alignment: Alignment.center, child: _getMarker()),
        ),
      ],
    );
  }
}
