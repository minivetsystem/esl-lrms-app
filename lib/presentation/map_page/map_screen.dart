// import '../home_screen_main/home_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:truck_booking_app/widgets/app_bar/custom_app_bar.dart';
// import 'package:truck_booking_app/core/app_export.dart';
// import 'package:truck_booking_app/widgets/app_bar/appbar_subtitle.dart';
// import 'package:truck_booking_app/widgets/app_bar/custom_app_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late CameraPosition cameraPosition;
  late GoogleMapController mapController;
  late LatLng _center = LatLng(22.586123, 88.486406);
  var mapTypeValue = MapType.terrain;
  Set<Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
    @override
  void initState(){
    super.initState();
    setState(() {
      getLocation().then((value) => {
        this._center = LatLng(value.latitude, value.longitude)
      });
    });
  }
  Future<Position> getLocation() async {
    // LocationPermission permission;
    bool permissionStatus = await Geolocator.isLocationServiceEnabled();
    if (!permissionStatus) {
      return Future.error("location service disabled");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("disabled");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        height: 50,
        title: AppbarSubtitle(text: "lbl_map".tr, margin: getMargin(left: 20)),
      ),
      body: Stack(children: <Widget>[
        GoogleMap(
          mapType: mapTypeValue,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 16.0,
          ),
          markers: _markers,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
        ),
        Positioned(
          bottom: 50,
          right: 20,
          child: SpeedDial(
            //Speed dial men//margin bottom
            icon: Icons.arrow_upward_outlined,
            //icon on Floating action button//shape of button
            children: [
              SpeedDialChild(
                //speed dial child
                child: Image.asset(
                  mapTypeValue == MapType.terrain
                      ? ImageConstant.layers
                      : ImageConstant.layers,
                  height: 20,
                  width: 20,
                ),
                onTap: () {
                  setState(() {
                    if (this.mapTypeValue == MapType.terrain) {
                      this.mapTypeValue = MapType.satellite;
                    } else {
                      this.mapTypeValue = MapType.terrain;
                    }
                  });
                },
              ),
              SpeedDialChild(
                child: Icon(Icons.gps_fixed_outlined),
                onTap: () {

                },
              ),
              SpeedDialChild(
                child: Icon(Icons.keyboard_voice),
                onTap: () => print('THIRD CHILD'),
                onLongPress: () => print('THIRD CHILD LONG PRESS'),
              ),

              //add more menu item childs here
            ],
          ),
        )
      ]),
    );
  }
}
