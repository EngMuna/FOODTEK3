import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../responsive.dart';
import '../section4/search.dart';

class SetLocationPage extends StatefulWidget {
  const SetLocationPage({super.key});

  @override
  State<SetLocationPage> createState() => _SetLocationPageState();
}

class _SetLocationPageState extends State<SetLocationPage>
    with TickerProviderStateMixin {
  static const CameraPosition _kGooglePlex = CameraPosition(
    bearing: 10,
    tilt: 20,
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final double _markerPositionX = 37.42796133580664;
  final double _markerPositionY = -122.085749655962;
  late BitmapDescriptor customMarker; //attribute

  getCustomMarker() async {
    customMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty,'assets/images/marker.png');
  }
  @override
  void initState() {
    super.initState();
    getCustomMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: {
              Marker(
                  markerId: MarkerId('marker'),
                  position: LatLng(_markerPositionX, _markerPositionY),
                 // icon: BitmapDescriptor.defaultMarker,
                  draggable: true,
                onTap: () {
                print('Marker tabed');
              },
                icon: customMarker,),
            },
            padding: EdgeInsets.only(
              top: responsiveHeight(
                context,
                550,
              ),
            ),
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            initialCameraPosition: _kGooglePlex,
            mapType: MapType.terrain,
            onMapCreated: (GoogleMapController controller) {
              controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(_markerPositionX, _markerPositionY),
                  zoom: 14.0,
                ),
              ));
            },
          ),
          Positioned(
              bottom: responsiveHeight(context, 86),
              left: responsiveWidth(context, 48),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                width: responsiveWidth(context, 343),
                height: responsiveHeight(context, 154),
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: responsiveWidth(context, 24),
                    vertical: responsiveHeight(context, 24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "your location",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "123 Al-Madina Street, Abdali, Amman, Jordan",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    //TODO:navigate to inforamation screen
                    Container(
                      margin:
                      EdgeInsets.only(top: responsiveHeight(context, 10)),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(context, 24)),
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Set Location")),
                    )
                  ],
                ),
              )),
          Positioned(
            width: responsiveWidth(context, 432),
            top: responsiveHeight(context, 61),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(context, 24)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Intl.getCurrentLocale() == 'en'
                          ? Icons.arrow_back
                          : Icons.arrow_forward)),
                  Expanded(
                      child: SearchScreen()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}