// import '../home_screen_main/home_main_screen.dart';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/home_screen_main/controller/home_four_controller.dart';
import 'package:vedanta_lrms/presentation/home_screen_main/models/home_four_model.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
// import 'package:vedanta_lrms/core/app_export.dart';
// import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
// import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  HomeFourController controller =
      Get.put(HomeFourController(HomeFourModel().obs));
  late CameraPosition cameraPosition;
  late GoogleMapController mapController;
  late LatLng _center = LatLng(22.586123, 88.486406);
  var mapTypeValue = MapType.terrain;
  Set<Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  converCoordinates(){

  }
  @override
  void initState() {
    super.initState();

    setState(() {
      getLocation().then(
          (value) => {this._center = LatLng(value.latitude, value.longitude)});
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
        // Positioned(
        //   top: 100,
        //   child: Padding(
        //     padding: getPadding(top: 16, right: 20, left: 20),
        //     child: CustomTextFormField(
        //       shadowTextfield: true,
        //       function: () {
        //         Get.toNamed(AppRoutes.searchOneScreen);
        //       },
        //       textInputType: TextInputType.none,
        //       width: double.infinity,
        //       focusNode: FocusNode(),
        //       hintText: "lbl_search_location".tr,
        //       variant: TextFormFieldVariant.OutlineBlack90016,
        //       shape: TextFormFieldShape.RoundedBorder10,
        //       padding: TextFormFieldPadding.PaddingT14_1,
        //       fontStyle: TextFormFieldFontStyle.SFUITextRegular17,
        //       prefix: Container(
        //         margin: getMargin(
        //           left: 16,
        //           top: 12,
        //           right: 8,
        //           bottom: 12,
        //         ),
        //         child: CustomImageView(
        //           svgPath: ImageConstant.imgContrast,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
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
                child: Icon(Icons.search_outlined),
                onTap: () {
                  Get.toNamed(AppRoutes.searchOneScreen);
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
