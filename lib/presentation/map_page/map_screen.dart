// import '../home_screen_main/home_main_screen.dart';

// import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
// import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vedanta_lrms/core/app_export.dart';
// import 'package:vedanta_lrms/data/apiClient/api_client.dart';
import 'package:vedanta_lrms/presentation/home_screen_main/controller/home_four_controller.dart';
import 'package:vedanta_lrms/presentation/home_screen_main/models/home_four_model.dart';
// import 'package:vedanta_lrms/presentation/map_page/models/load_map_data_model.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_map_geojson/flutter_map_geojson.dart';
// import 'package:latlong2/latlong.dart';
// import 'dart:convert';
// import 'package:flutter_map_geojson/flutter_map_geojson.dart';
// import 'package:location/location.dart';
// import 'package:vedanta_lrms/core/app_export.dart';
// import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
// import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';

class MapScreen extends StatefulWidget {
  final id;
  const MapScreen({super.key, required this.id});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<List<LatLng>> polygons = [];
  // List<List<LatLng>> polygons = [];

  // List<List<LatLng>> coordinates = [];
  bool _mapLoaded = false;
  var label = {};
  GeoJsonParser myGeoJson = GeoJsonParser();
  int? modifiedData;
  HomeFourController controller =
      Get.put(HomeFourController(HomeFourModel().obs));
  // late CameraPosition cameraPosition;
  // late GoogleMapController mapController;
  late LatLng _center = LatLng(22.586123, 88.486406);
  // var mapTypeValue = MapType.terrain;
  // Set<Marker> _markers = Set();
  // Set<Polygon> _polygons = Set();
  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  final MapController _mapController = MapController();
  // Set<Polygon> _polygon = HashSet<Polygon>();
 
  // created list of locations to display polygon
  // List<LatLng> points = [
  //   // LatLng(19.0759837, 72.8776559),
  //   // LatLng(28.679079, 77.069710),
  //   // LatLng(26.850000, 80.949997),
  //   // LatLng(19.0759837, 72.8776559),
  // ];
  // Future<void> _parseGeoJson() async {
  //   final geoJson = GeoJsonParser();
  //   final geoJsonResult = geoJson.parseGeoJsonAsString(stringGeoJSon!);
  //     _addMarkersAndPolygons(geoJson);
  // }

  // void _addMarkersAndPolygons(GeoJsonParser stringGeoJSon) {
  //   for (var feature in stringGeoJSon.features) {
  //     if (feature.geometry is stringGeoJSon) {
  //       final point = feature.geometry as stringGeoJSon;
  //       final coordinates = LatLng(point.geoPoint.latitude, point.geoPoint.longitude);

  //       final marker = Marker(
  //         markerId: MarkerId(coordinates.toString()),
  //         position: coordinates,
  //         infoWindow: InfoWindow(
  //           title: 'Marker Title',
  //           snippet: 'Marker Snippet',
  //         ),
  //       );

  //       _markers.add(marker);
  //     } else if (feature.geometry is GeoJsonPolygon) {
  //       final polygon = feature.geometry as GeoJsonPolygon;

  //       final polygonCoordinates = polygon.geoSerie.toLatLng();
  //       final polygonId = PolygonId(polygonCoordinates.toString());

  //       final poly = Polygon(
  //         polygonId: polygonId,
  //         points: polygonCoordinates,
  //         strokeWidth: 2,
  //         strokeColor: Colors.blue,
  //         fillColor: Colors.blue.withOpacity(0.2),
  //       );

  //       _polygons.add(poly);
  //     }
  //     // Add more cases for other geometry types as needed
  //   }
  // }

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
      // data['results']['data']['features'].forEach((data) {
      //   print(data['geometry']['coordinates'][0][0][0]);
      //   points.add(LatLng(data['geometry']['coordinates'][0][0][0],
      //       data['geometry']['coordinates'][0][0][1]));
      // });
      // return points;
      // print(data['results']['data']);
      //  Map<String, dynamic> geoJsonMap = data['results']['data'];
      // print(geoJsonMap);
      label = data['results']['data'];
      polygons = parseGeoJson(data['results']['data']);
      // log('''${data['results']['data'].toString()}''');
      // log('''${polygons.toString()}''');
      if (polygons != []) {
        setState(() {
          _mapLoaded = true;
          getLocation().then((value) =>
              {this._center = LatLng(value.latitude, value.longitude)});
        });
      } else {
        setState(() {
          _mapLoaded = false;
        });
      }
//  return parseGeoJson(data['results']['data']);
    } else {
      throw Exception();
    }
  }

  List<List<LatLng>> parseGeoJson(geoJsonString) {
    // Map<String, dynamic> geoJsonMap = json.decode(geoJsonString);
    // print(geoJsonMap);
    Map<String, dynamic> geoJsonMap = geoJsonString;
    print(geoJsonMap);
    List<List<LatLng>> coordinates = [];

    if (geoJsonMap.containsKey('features')) {
      var features = geoJsonMap['features'] as List<dynamic>;
      for (var feature in features) {
        if (feature.containsKey('geometry')) {
          var geometry = feature['geometry'];
          if (geometry.containsKey('type') && geometry['type'] == 'Polygon') {
            var polygonCoordinates = <LatLng>[];
            var coordinatesList = geometry['coordinates'][0];
            for (var coordinate in coordinatesList) {
              polygonCoordinates.add(LatLng(coordinate[1], coordinate[0]));
            }
            coordinates.add(polygonCoordinates);
          }
        }
      }
    }

    return coordinates;
  }

  @override
  void initState() {
    super.initState();
    _mapLoaded = false;
    modifiedData = widget.id;
    _fetchGeoJsonData(modifiedData);
    // Future.delayed(const Duration(seconds: 3), () {
    //   setState(() {
    //     _mapLoaded = true;
    //     getLocation().then(
    //       (value) => {this._center = LatLng(value.latitude, value.longitude)});
    //   });

    // });

// polygons = parseGeoJson(stringGeoJSon!);
// print(polygons);
    // parse GeoJson data - GeoJson is stored as [String]
    // myGeoJson.parseGeoJsonAsString(stringGeoJSon);

    // print(modifiedData);
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
          // GoogleMap(
          //   mapType: mapTypeValue,
          //   onMapCreated: _onMapCreated,
          //   initialCameraPosition: CameraPosition(
          //     target: _center,
          //     zoom: 16.0,
          //   ),
          //   markers: _markers,
          //   myLocationEnabled: true,
          //   zoomControlsEnabled: false,
          //   polygons:  myGeoJson.polygons,

          // ),
          _mapLoaded
              ? FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    // initialCenter: LatLng(45.993807, 14.483972),
                    center: _center != null
                        ? _center
                        : LatLng(22.571085, 88.372896),
                    zoom: 14,
                  ),
                  children: [
                    TileLayer(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: const ['a', 'b', 'c']),
                    
                    PolygonLayer(
                      polygons: polygons
                          .map(
                            (polygon) => Polygon(
                              label:"",
                              points: polygon,
                              color: Colors.blue.withOpacity(0.5),
                              borderStrokeWidth: 2.0,
                              borderColor: Colors.red,
                              isFilled: true
                            ),
                          )
                          .toList(),
                    ),
                    
                    PolylineLayer(polylines: myGeoJson.polylines),
                    MarkerLayer(markers: myGeoJson.markers)
                  ],
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
          // Positioned(
          //   bottom: 50,
          //   right: 20,
          //   child: SpeedDial(
          //     //Speed dial men//margin bottom
          //     icon: Icons.arrow_upward_outlined,
          //     //icon on Floating action button//shape of button
          //     children: [
          //       SpeedDialChild(
          //         //speed dial child
          //         child: Image.asset(
          //           mapTypeValue == MapType.terrain
          //               ? ImageConstant.layers
          //               : ImageConstant.layers,
          //           height: 20,
          //           width: 20,
          //         ),
          //         onTap: () {
          //           setState(() {
          //             if (this.mapTypeValue == MapType.terrain) {
          //               this.mapTypeValue = MapType.satellite;
          //             } else {
          //               this.mapTypeValue = MapType.terrain;
          //             }
          //           });
          //         },
          //       ),
          //       SpeedDialChild(
          //         child: Icon(Icons.search_outlined),
          //         onTap: () {
          //           Get.toNamed(AppRoutes.searchOneScreen);
          //         },
          //       ),
          //       SpeedDialChild(
          //         child: Icon(Icons.keyboard_voice),
          //         onTap: () => print('THIRD CHILD'),
          //         onLongPress: () => print('THIRD CHILD LONG PRESS'),
          //       ),

          //       //add more menu item childs here
          //     ],
          //   ),
          // )
        ]));
  }
}
