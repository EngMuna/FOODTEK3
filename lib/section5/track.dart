import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:web/section6/homepagee.dart';
import 'package:web/section4/search.dart';
import '../section6/cart_home.dart';
import '../section6/history_empty.dart';
import '../responsive.dart';
import '../section6/historyscreen.dart';
import '../train/favorite.dart';
import '../train/person.dart';
import 'order_details.dart';
import 'profile1.dart';
import 'OrderTrack_widget.dart';
import 'alexander.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}
int _currentindexed=0;

final List<Widget> screens=[
  Person(),//profile
  Favorite(),
  HistoryEmpty(),
  Carthome(),

];

class _TrackPageState extends State<TrackPage> {
  LatLng sourceDes = LatLng(37.33500926, -122.03272188);
  LatLng destination = LatLng(37.33429383, -122.06600055);
  LatLng carPosition = LatLng(37.33382, -122.0498);

  List<LatLng> polyLineCoordinatesFromResturant = [];
  List<LatLng> polyLineCoordinatesToHome = [];
  String googleApiKey = "YOUR_GOOGLE_MAPS_API_KEY";

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
    } else {
      print('No points found in polyline result');
    }
    setState(() {});
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
    } else {
      print('No points found in polyline result');
    }
    setState(() {});
  }


  Set<Marker> markers = {};
  getCustomIconMarker() async {
    final BitmapDescriptor homeIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(30, 30)),
      "assets/images/homelogo.png",
    );
    final BitmapDescriptor carIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      "assets/images/car.png",
    );
    final BitmapDescriptor resturantIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      "assets/images/resturantLogo.png",
    );

    markers.addAll({
      Marker(
        icon: homeIcon,
        markerId: MarkerId("initial Location"),
        position: sourceDes,
      ),
      Marker(
        zIndex: 10,
        infoWindow: InfoWindow(title: "hello world", snippet: "distance"),
        icon: carIcon,
        markerId: MarkerId("car Location"),
        position: carPosition,
      ),
      Marker(
        icon: resturantIcon,
        markerId: MarkerId("second Location"),
        position: destination,
      ),
    });
    setState(() {});
  }


  @override
  void initState() {
    getPolyPointsFromResturant();
    getPolyPointsToHome();
    getCustomIconMarker();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
            initialCameraPosition: CameraPosition(
              target: sourceDes,
              zoom: 13.5,
            ),
            markers: markers,
            polylines: {
              Polyline(
                  width: 2,
                  polylineId: PolylineId("route"),
                  points: polyLineCoordinatesFromResturant,
                  color: Color(0xff25AE4B)),
              Polyline(
                  width: 2,
                  polylineId: PolylineId("route2"),
                  points: polyLineCoordinatesToHome,
                  color:Colors.black),
            }),

        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SearchScreen(),
        ),

        Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(context, 21),
                  vertical: responsiveHeight(context, 28)),
              height: responsiveHeight(context, 300),
              width: responsiveWidth(context, 432),
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text("On The way",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                        TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Color(0xff25AE4B)),
                          onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OrderDetailsScreen()),
                          );},
                          child: Text("All Details",style: TextStyle(fontSize: 16,)),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      spacing: responsiveWidth(context, 10),
                      children: [
                        Expanded(
                          child: OrderTrackStatusWidget(
                            title: "order Placed",
                            value: 1,
                          ),
                        ),
                        Expanded(
                          child: OrderTrackStatusWidget(
                            title: "On the way",
                          ),
                        ),
                        Expanded(
                          child: OrderTrackStatusWidget(
                            title: "Deliverd",
                            value: 0,
                          ),
                        ),
                      ],
                    ),
                  ),

                      Alexander(),
                  //DeliveryGuyDetailsWidget(),
                  //YourLocationDetailsWidget(),
                ],
              ),
            )),
      ]),
        floatingActionButton: Transform.translate(
          offset: Offset(0, 10), // نزلي الزر 10 بكسل لتحت
          child: Stack(
            alignment: Alignment.center,
            children: [
              // الدائرة الخلفية الفاتحة
              Container(
                width: responsiveWidth(context, 65),
                height: responsiveHeight(context, 65),
                decoration: BoxDecoration(
                  color: Color(0xffDBF4D1),
                  shape: BoxShape.circle,
                  boxShadow: [], // بدون ظل
                ),
              ),
              // الزر الرئيسي
              FloatingActionButton(
                elevation: 0,
                highlightElevation: 0,
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepagee()),
                );
                  setState(() {
                    _currentindexed = 2;
                  });
                },
                shape: CircleBorder(),
                backgroundColor: Color(0xff25AE4B),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xffDBF4D1),
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: responsiveHeight(context, 81),
        color: Color(0xffDBF4D1),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xffDBF4D1),
          selectedItemColor: Color(0xff25AE4B),
          unselectedItemColor: Color(0xff484C52),
          selectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          currentIndex: _currentindexed,
          onTap: (index) {
            setState(() {
              _currentindexed = index;
            });

            if (index == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Prof()),
              );
            }; if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Historyscreen()),
              );
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Icon(Icons.home_outlined, size: 30),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border, size: 30),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(width: responsiveWidth(context, 15)),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time_rounded, size: 30),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined, size: 30),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}