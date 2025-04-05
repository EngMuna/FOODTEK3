
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class UserLocationMap extends StatefulWidget {
  @override
  _UserLocationMapState createState() => _UserLocationMapState();
}

class _UserLocationMapState extends State<UserLocationMap> {
  GoogleMapController? _controller;
  LatLng? _userLocation;
  LatLng destination = LatLng(31.9570, 35.9150); // موقع الوجهة
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  BitmapDescriptor? userIcon;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _loadCustomIcons();
  }

  // تحميل صورة الماركر
  void _loadCustomIcons() async {
    userIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/man2.png',
    );
  }

  // جلب الموقع الحقيقي
  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
      _markers.add(
        Marker(
          markerId: MarkerId('user'),
          position: _userLocation!,
          icon: userIcon ?? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );

      _markers.add(
        Marker(
          markerId: MarkerId('destination'),
          position: destination,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ),
      );

      _polylines.add(
        Polyline(
          polylineId: PolylineId('route'),
          points: [_userLocation!, LatLng(31.9555, 35.9125), destination],
          color: Colors.green,
          width: 4,
          patterns: [PatternItem.dash(10), PatternItem.gap(5)], // خط منكسر
        ),
      );
    });

    _controller?.animateCamera(CameraUpdate.newLatLngZoom(_userLocation!, 15));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _userLocation == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _userLocation!,
          zoom: 15,
        ),
        markers: _markers,
        polylines: _polylines,
        circles: {
          Circle(
            circleId: CircleId("user_radius"),
            center: _userLocation!,
            radius: 100, // نصف قطر الدائرة
            fillColor: Colors.green.withOpacity(0.3),
            strokeColor: Colors.green,
            strokeWidth: 1,
          ),
        },
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
    );
  }
}
