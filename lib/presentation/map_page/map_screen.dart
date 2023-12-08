// import '../home_screen_main/home_main_screen.dart';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/data/apiClient/api_client.dart';
import 'package:vedanta_lrms/presentation/home_screen_main/controller/home_four_controller.dart';
import 'package:vedanta_lrms/presentation/home_screen_main/models/home_four_model.dart';
import 'package:vedanta_lrms/presentation/map_page/models/load_map_data_model.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
// import 'package:vedanta_lrms/core/app_export.dart';
// import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
// import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';

class MapScreen extends StatefulWidget {
  final id;
  const MapScreen({super.key,required this.id});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
late int modifiedData;
  HomeFourController controller =
      Get.put(HomeFourController(HomeFourModel().obs));
  late CameraPosition cameraPosition;
  late GoogleMapController mapController;
  late LatLng _center = LatLng(22.586123, 88.486406);
  var mapTypeValue = MapType.terrain;
  Set<Marker> _markers = {};
  var mapData = {};
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
   Set<Polygon> polygons = HashSet<Polygon>();
List<LatLng> coordinates = [];
  void _addPolygon() {
    List<LatLng> polygonCoordinates = [
      LatLng(23.62842146376072349767127889208495616912841796875, 87.0562996865167662008389015682041645050048828125),
      LatLng(23.626714619960214491811711923219263553619384765625, 87.055447329259180833105347119271755218505859375),
      LatLng(23.625964323521525756177652510814368724822998046875, 87.055108447785727321388549171388149261474609375),
      LatLng(23.6261690079184774049281259067356586456298828125, 87.0545844689814742878297693096101284027099609375),
      LatLng(23.625936856366759997172266594134271144866943359375, 87.054414253945111568100401200354099273681640625),
          LatLng(23.62842146376072349767127889208495616912841796875, 87.0562996865167662008389015682041645050048828125),
      LatLng(23.626714619960214491811711923219263553619384765625, 87.055447329259180833105347119271755218505859375),
      LatLng(23.625964323521525756177652510814368724822998046875, 87.055108447785727321388549171388149261474609375),
      LatLng(23.6261690079184774049281259067356586456298828125, 87.0545844689814742878297693096101284027099609375),
      LatLng(23.625936856366759997172266594134271144866943359375, 87.054414253945111568100401200354099273681640625),
    ];


    Polygon polygon = Polygon(
      polygonId: PolygonId('examplePolygon'),
      points: polygonCoordinates,
      // fillColor: Colors.blue.withOpacity(0.5),
      fillColor: Colors.red,

      strokeColor: Colors.blue,
      strokeWidth: 4,
    );

    setState(() {
      polygons.add(polygon);
    });
  }
  @override
  void initState() {
    super.initState();
    modifiedData = widget.id;
    // print(modifiedData);
    _addPolygon();
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
      body: FutureBuilder(
        future: ApiClient().getLoadListData(modifiedData),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Assuming your API returns a list of items
              final result = snapshot.data;
              print(result);

              return Stack(
            children: <Widget>[
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
              polygons: polygons,
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
          ])
      ;
        }}
      ),
    );
  }
}
