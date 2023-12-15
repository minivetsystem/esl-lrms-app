import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/home_screen_main/controller/home_four_controller.dart';
import 'package:vedanta_lrms/presentation/home_screen_main/models/home_four_model.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  final id;
  final searchPlotId;
  const MapScreen({super.key, this.id, this.searchPlotId});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Polygon> polygons = Set();
  Set<Polygon> poly = Set();
  bool _mapLoaded = false;
  var label = {};
  String? plotId;
  String? villageId;
  int? modifiedData;
  int? searchPlotId;
  Set<Marker> _marker = Set();
  var mapTypeValue = MapType.terrain;
  HomeFourController controller =
      Get.put(HomeFourController(HomeFourModel().obs));
  late CameraPosition cameraPosition;
  late GoogleMapController mapController;

  late LatLng _center = LatLng(0, 0);
  late LatLng _myPosition = LatLng(22.579129, 88.434436);
  _fetchPlotDetailsbySearchId(searchPlotId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
        Uri.parse('${Constant.baseurl}search-plot?plot_id=$searchPlotId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // label = data['mapFeatures'];
      // print(data);
      poly = parseGeoJson(data['geoJSONData']);
      if (poly != []) {
        setState(() {
          _mapLoaded = true;
        });
      } else {
        setState(() {
          _mapLoaded = false;
        });
      }
    } else {
      throw Exception();
    }
  }

  _fetchGeoJsonData(modifiedData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
        Uri.parse('${Constant.baseurl}load-map-data/$modifiedData'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      label = data['results']['data'];
      print("label $label");
      _marker.add(Marker(
          markerId: MarkerId('1'),
          position: LatLng(data['results']['lat'], data['results']['lng']),
          infoWindow: InfoWindow()));

      poly = parseGeoJson(data['results']['data']);
      if (poly != []) {
        setState(() {
          _center = LatLng(data['results']['lat'], data['results']['lng']);
          _mapLoaded = true;
        });
      } else {
        setState(() {
          _mapLoaded = false;
        });
      }
    } else {
      throw Exception();
    }
  }

  Set<Polygon> parseGeoJson(geoJsonString) {
    // Map<String, dynamic> geoJsonMap = json.decode(geoJsonString);
    Map<String, dynamic> geoJsonMap = geoJsonString;
    // print(geoJsonMap);
    List<List<LatLng>> coordinates = [];
    if (geoJsonMap.containsKey('features')) {
      var features = geoJsonMap['features'] as List<dynamic>;
      for (var feature in features) {
        if (feature.containsKey('geometry') &&
            feature.containsKey('properties')) {
          var geometry = feature['geometry'];
          var properties = feature['properties'];
          if (geometry.containsKey('type') && geometry['type'] == 'Polygon') {
            var polygonCoordinates = <LatLng>[];
            var coordinatesList = geometry['coordinates'][0];
            print(properties['plot_id']);
            for (var coordinate in coordinatesList) {
              polygonCoordinates.add(LatLng(coordinate[1], coordinate[0]));
            }

            coordinates.add(polygonCoordinates);

            polygons.add(
              Polygon(
                  polygonId: PolygonId('${properties['id']}'),
                  // initialize the list of points to display polygon
                  points: polygonCoordinates,
                  // given color to polygon
                  fillColor: Colors.green.withOpacity(0.3),
                  //  Colors.green.withOpacity(0.3),
                  // given border color to polygon
                  strokeColor: Colors.red,
                  geodesic: true,
                  // given width of border
                  strokeWidth: 4,
                  consumeTapEvents: true,
                  onTap: () {
                    print(properties);
                    showModalBottomSheet<void>(
                        // context and builder are
                        // required properties in this widget
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                              height: 650,
                              child: Center(
                                  child: Container(
                                      color: ColorConstant.whiteA700,
                                      padding: EdgeInsets.all(20),
                                      width: double.infinity,
                                      child: Column(
                                        children: [
                                          Text('text'),
                                        ],
                                      ))));
                        });
                  }),
            );
          }
        }
      }
    }
    // return coordinates;
    return polygons;
  }

  @override
  void initState() {
    super.initState();
    _mapLoaded = false;
    modifiedData = widget.id;
    if (widget.searchPlotId != 0) {
      searchPlotId = widget.searchPlotId;
    } else {
      searchPlotId = 0;
    }

    // print(modifiedData);
    if (searchPlotId == 0) {
      if (modifiedData == 0) {
        getLocation().then((value) => {
              setState(() {
                _myPosition = LatLng(value.latitude, value.longitude);
                _marker.add(Marker(
                    markerId: MarkerId('1'),
                    position: _myPosition,
                    infoWindow: InfoWindow()));
                poly = Set();
                _mapLoaded = true;
              })
            });
      } else {
        print(modifiedData);
        _fetchGeoJsonData(modifiedData);
      }
    } else {
      _fetchPlotDetailsbySearchId(searchPlotId);
      //write your custom code
    }
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
          title:
              AppbarSubtitle(text: "lbl_map".tr, margin: getMargin(left: 20)),
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

                  polygons: poly,
                  markers: _marker,
                )

              // ? FlutterMap(
              //     mapController: _mapController,
              //     options: MapOptions(
              //         // initialCenter: LatLng(45.993807, 14.483972),
              //         center: _center != null
              //             ? _center
              //             : LatLng(22.571085, 88.372896),
              //         zoom: 14,

              //       ),

              //     children: [
              //       TileLayer(
              //           urlTemplate:
              //               "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              //           subdomains: const ['a', 'b', 'c']),
              //       PolygonLayer(
              //         polygons: poly,

              //         // polygons
              //         //     .map(
              //         //       (polygon) => Polygon(

              //         //           label: '',
              //         //           points: polygon,
              //         //           color: Colors.blue.withOpacity(0.5),
              //         //           borderStrokeWidth: 2.0,
              //         //           borderColor: Colors.red,
              //         //           isFilled: true,),
              //         //     )
              //         //     .toList(),

              //         polygonLabels: true,

              //       ),
              //       MarkerLayer(markers: myGeoJson.markers),

              //     ],
              //   )
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
                SpeedDialChild(
                  child: Icon(Icons.search_outlined),
                  onTap: () {
                    Get.toNamed(AppRoutes.searchOneScreen);
                  },
                ),
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
