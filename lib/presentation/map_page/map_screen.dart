import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/home_screen_main/controller/home_four_controller.dart';
import 'package:vedanta_lrms/presentation/home_screen_main/models/home_four_model.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
            //  if (feature.getProperty('plot_id') === 0) {
            //               if (feature.getProperty('id') === 0) {
            //                 color = 'red';
            //               }
            //             } else {
            //               if (feature.getProperty('plot_id') !== 0) {
            //                 color = 'green';
            //               }
            //             }
            var color = properties['plot_id'] == 0
                ? properties['id'] == 0
                    ? Colors.red.withOpacity(0.3)
                    : Colors.blue.withOpacity(0.3)
                : properties['plot_id'] != 0
                    ? Colors.green.withOpacity(0.3)
                    : Colors.red.withOpacity(0.3);
            polygons.add(
              Polygon(
                  polygonId: PolygonId('${properties['id']}'),
                  // initialize the list of points to display polygon
                  points: polygonCoordinates,
                  // given color to polygon
                  fillColor: color,

                  //  Colors.green.withOpacity(0.3),
                  // given border color to polygon
                  strokeColor: Colors.black,
                  geodesic: true,
                  // given width of border
                  strokeWidth: 2,
                  consumeTapEvents: true,
    
                  onTap: () {
                    print(properties);
                    getPlotDetails(properties['id'], properties['village_id']);
                  }),
            );
          }
        }
      }
    }
    // return coordinates;
    return polygons;
  }

  Future<void> downloadBi(Uri uri) async {
    var url = Uri.parse('$uri');
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  getPlotDetails(plotId, villageId) async {
    print(plotId);
    print(villageId);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
        Uri.parse(
            '${Constant.baseurl}plot-details?village_id=${villageId}&plot_id=${plotId}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == true) {
        if (data['plot'].containsKey('plot_detail') &&
            data['plot']['plot_detail'] != null) {
          showModalBottomSheet<void>(
              // context and builder are
              // required properties in this widget
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 650,
                  child: Container(
                    color: Colors.grey.shade300,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.green.shade300,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                '${data['plot']['plot_detail']['owner_name']}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: const Color.fromARGB(255, 245, 244, 244),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Deed no.:',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'N/A',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Khasra no.:',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '${data['plot']['khasara_no']}',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Location:',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '${data['plot']['village']['name']}',
                                      style: TextStyle(fontSize: 14),
                                    ), //Text
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Holiding Type :',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '${data['plot']['plot_detail']['holding_type']}',
                                      style: TextStyle(fontSize: 14),
                                    ), //Text
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Status of Mutation :',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'N/A',
                                      style: TextStyle(fontSize: 14),
                                    ), //Text
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Total Area :',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '${data['plot']['plot_detail']['area']}',
                                      style: TextStyle(fontSize: 14),
                                    ), //Text
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Total Area (In Bhuiyan) :',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '${data['plot']['plot_detail']['area_in_bhuiyan']}',
                                      style: TextStyle(fontSize: 14),
                                    ), //Text
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Remarks :',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'N/A',
                                      style: TextStyle(fontSize: 14),
                                    ), //Text
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Download B(I) :',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    data['plot']['plot_detail']
                                                ['naksha_link'] !=
                                            null
                                        ? InkWell(
                                            onTap: () async {
                                              // downloadBi(data['plot']
                                              //     ['plot_detail']['naksha_link'])
                                              var url = Uri.parse(
                                                  '${data['plot']['plot_detail']['naksha_link']}');
                                              if (!await launchUrl(url,
                                                  mode: LaunchMode
                                                      .inAppBrowserView)) {
                                                throw Exception(
                                                    'Could not launch $url');
                                              }
                                            },
                                            child: const Icon(
                                              Icons.download_outlined,
                                              color: Colors.grey,
                                            ),
                                          )
                                        : Text('Not Available')
                                    //Text
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Download P(II) :',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    data['plot']['plot_detail']
                                                ['pii_document_link'] !=
                                            null
                                        ? InkWell(
                                            onTap: () async {
                                              final Uri url = Uri.parse(
                                                  '${data['plot']['plot_detail']['pii_document_link']}');
                                              if (!await launchUrl(url,
                                                  mode: LaunchMode
                                                      .inAppBrowserView)) {
                                                throw Exception(
                                                    'Could not launch $url');
                                              }
                                            },
                                            child: const Icon(
                                              Icons.download_outlined,
                                              color: Colors.grey,
                                            ),
                                          )
                                        : Text('Not Available'), //Text
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else {}
      } else {
        showModalBottomSheet<void>(
            // context and builder are
            // required properties in this widget
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 650,
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' Not Data Available',
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      }
    } else {
      throw Exception();
    }
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

                  polygons: poly,
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
