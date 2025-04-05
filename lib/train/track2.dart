import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Track2 extends StatefulWidget {
  const Track2({super.key});

  @override
  State<Track2> createState() => _Track2State();
}

class _Track2State extends State<Track2> {
  LatLng sourceDes = LatLng(37.33500926, -122.03272188);
  LatLng destination = LatLng(37.33429383, -122.06600055);
  LatLng carPosition = LatLng(37.33382, -122.0498);
  Set<Marker> markers = {};
  String googleApiKey = "AIzaSyCUHn8e7BBuGFgccl6of-OyGCnIHDUVaeE";
  List<LatLng> polyLineCoordinatesFromResturant = [];
  List<LatLng> polyLineCoordinatesToHome = [];

  GoogleMapController? _controller;  // GoogleMap controller

  void getPolyPointsFromResturant() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: googleApiKey,
        request: PolylineRequest(
            origin: PointLatLng(sourceDes.latitude, sourceDes.longitude),
            destination:
            PointLatLng(carPosition.latitude, carPosition.longitude),
            mode: TravelMode.driving));
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polyLineCoordinatesFromResturant
            .add(LatLng(point.latitude, point.longitude));
      }
      print("Polyline from Restaurant: $polyLineCoordinatesFromResturant");  // طباعة النقاط
      setState(() {});
      _updateCameraPosition();  // إعادة ضبط الكاميرا بعد تحميل المسار
    } else {
      print('No points found in polyline result');
    }
  }

  void getPolyPointsToHome() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: googleApiKey,
        request: PolylineRequest(
            origin: PointLatLng(carPosition.latitude, carPosition.longitude),
            destination:
            PointLatLng(destination.latitude, destination.longitude),
            mode: TravelMode.driving));
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polyLineCoordinatesToHome.add(LatLng(point.latitude, point.longitude));
      }
      print("Polyline to Home: $polyLineCoordinatesToHome");  // طباعة النقاط
      setState(() {});
      _updateCameraPosition();  // إعادة ضبط الكاميرا بعد تحميل المسار
    } else {
      print('No points found in polyline result');
    }
  }

  // إعادة ضبط الكاميرا لعرض المسار
  void _updateCameraPosition() {
    if (_controller != null && polyLineCoordinatesFromResturant.isNotEmpty) {
      final LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(
          polyLineCoordinatesFromResturant[0].latitude,
          polyLineCoordinatesFromResturant[0].longitude,
        ),
        northeast: LatLng(
          polyLineCoordinatesFromResturant.last.latitude,
          polyLineCoordinatesFromResturant.last.longitude,
        ),
      );

      _controller?.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 50), // هامش 50 للوصول إلى الـ polyline
      );
    }
  }


  @override
  void initState() {
    super.initState();
    getPolyPointsFromResturant();
    getPolyPointsToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: sourceDes,
          zoom: 13.5,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;  // تخزين المرجع إلى الخريطة
        },
        markers: {
          Marker(
            markerId: MarkerId("initial Location"),
            position: sourceDes,
          ),
          Marker(
            markerId: MarkerId("second Location"),
            position: destination,
          ),
          Marker(
            zIndex: 10,
            infoWindow: InfoWindow(title: "Car Location", snippet: "Distance"),
            markerId: MarkerId("car Location"),
            position: carPosition,
          ),
        },
        polylines: {
          Polyline(
            width: 4,
            polylineId: PolylineId("route"),
            points: polyLineCoordinatesFromResturant,
            color: Colors.blue,
          ),
          Polyline(
            width: 4,
            polylineId: PolylineId("route2"),
            points: polyLineCoordinatesToHome,
            color: Colors.red,
          ),
        },
      ),
    );
  }
}
