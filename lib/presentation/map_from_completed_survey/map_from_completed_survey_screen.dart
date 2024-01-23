
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';

class MapFromCompletedSurvey extends StatefulWidget {
  final surveId;
  final notificationStatus;
  final markersFromVisits;
  final lat;
  final lng;
  const MapFromCompletedSurvey(
      {super.key,
      this.surveId,
      this.notificationStatus,
      this.markersFromVisits,
      this.lat,
      this.lng});

  @override
  State<MapFromCompletedSurvey> createState() => _MapFromCompletedSurveyState();
}

class _MapFromCompletedSurveyState extends State<MapFromCompletedSurvey> {
  var mapTypeValue = MapType.terrain;
bool _mapLoaded = false;
  late CameraPosition cameraPosition;
  late GoogleMapController mapController;
  Set<Marker> _marker = Set();
  late LatLng _center = LatLng(0, 0);
  late LatLng _myPosition = LatLng(22.579129, 88.434436);
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
  void initState() {
    // TODO: implement initState
    super.initState();
          getLocation().then((value) => {
              setState(() {
                _myPosition = LatLng(value.latitude, value.longitude);
                _marker.add(Marker(
                    markerId: MarkerId('1'),
                    position: _myPosition,
                    infoWindow: InfoWindow()));
                // poly = Set();
                _mapLoaded = true;
              })
            });

    print('${widget.surveId} ${widget.notificationStatus} ${widget.lat} ${widget.lng}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          height: 50,
          title:
              AppbarSubtitle(text: "lbl_map".tr, margin: getMargin(left: 20)),
          leadingWidth: 44,
          leading: AppbarImage(
              height: getSize(32.00),
              width: getSize(32.00),
              svgPath: ImageConstant.imgArrowleft,
              margin: getMargin(left: 20, top: 12, bottom: 12),
              onTap: () {
                Navigator.pop(context);
              }),
        ),
        body: Stack(children: [
          _mapLoaded
              ? GoogleMap(
                  mapType: mapTypeValue,
                  onMapCreated: (controller) {
                    setState(() {
                      mapController = controller;
                    });
                  },
                  initialCameraPosition: CameraPosition(
                    // target: LatLng(22.586123, 88.486406),
                    target: _center.latitude != 0 ? _center : _myPosition,

                    zoom: 15.0,
                  ),

                  // markers: _markers,
                  // myLocationEnabled: true,
                  zoomControlsEnabled: false,

                  // polygons: poly,
                  markers: _marker,
                )
              : Center(child: CircularProgressIndicator()),
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
                // SpeedDialChild(
                //   child: Icon(Icons.search_outlined),
                //   onTap: () {
                //     Get.toNamed(AppRoutes.searchOneScreen);
                //   },
                // ),
                SpeedDialChild(
                  child: Icon(Icons.keyboard_voice),
                  onTap: () => {},
                ),

                //add more menu item childs here
              ],
            ),
          )
        ]));
  }
}
