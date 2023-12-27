import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';

class HistoryOneScreen extends StatefulWidget {
  final int? id;
  final String? notificationStatus;
  const HistoryOneScreen({super.key, this.id, this.notificationStatus});

  @override
  State<HistoryOneScreen> createState() => _HistoryOneScreenState();
}

class _HistoryOneScreenState extends State<HistoryOneScreen> {
  bool loadData = false;
  var geoJSONData;
  var geoJSONDataPlot;
  var lat;
  var lng;
  var isMultiPlot;
  var detailArray;
  var visitedArray;
  var notiStatus;
  var plotId;
  var plotmainId;
  List<dynamic> visits = [];
  var details;
  var detailsOne;

  getSurveyDetails(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
        Uri.parse('${Constant.baseurl}notification/get-survey-details/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // return SurveyDetails.fromJson(jsonResponse);
      // return json.decode(response.body);
      // label = data['mapFeatures'];

      setState(() {
        detailsOne = data['results']['details'];
        details = data['results']['details']['notification'];
        geoJSONData = data['results']['geoJSONData'];
        geoJSONDataPlot = data['results']['geoJSONDataPlot'];
        lat = data['results']['details']['notification']['detail'][0]['lat'];
        // visits = details['visits'];
         visits = details['visits'];
     
        lng = data['results']['details']['notification']['detail'][0]['lng'];
        isMultiPlot = data['results']['details']['notification']['detail'][0]
            ['is_multi_plot'];
        if (isMultiPlot == 1) {
          detailArray =
              data['results']['details']['notification']['detail_array'];
          visitedArray =
              data['results']['details']['notification']['visited_array'];
        }
        if (details['detail'][0]['plot'] != null) {
          plotId = details['detail'][0]['plot']['khasara_no'];
        } else {
          plotId = "";
        }

        if (details['detail'][0]['plot'] != null) {
          this.plotmainId = details['detail'][0]['plot']['id'];
        }
        loadData = true;
      });
    } else {
      throw Exception();
    }
  }
  numberingVisits( index){
    return index+1;
  }
  @override
  void initState() {
    super.initState();
    getSurveyDetails(widget.id);
    // Your initialization logic goes here
    // This method is called only once when the widget is inserted into the widget tree
  }

  dateFormat(date) {
    DateTime dd = DateTime.parse(date);
    String formattedDate = DateFormat.yMMMd('en_US').format(dd);
// String dateWithT = d.substring(0, 8);
// DateTime dateTime = DateTime.parse(dateWithT);
    return formattedDate;
  }

  String formatString(String input) {
    List<String> words = input.split('_');
    String formattedString = '';

    for (String word in words) {
      formattedString += word[0].toUpperCase() + word.substring(1);
    }

    return formattedString;
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        minimum: EdgeInsets.only(top: 20),
        color: ColorConstant.whiteA700,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.lightGray,
            appBar: CustomAppBar(
                // minimum:EdgeInsets.only(top: 20),
                height: getVerticalSize(57.00),
                leadingWidth: 44,
                leading: AppbarImage(
                    height: getSize(24.00),
                    width: getSize(24.00),
                    svgPath: ImageConstant.imgArrowleftWhiteA700,
                    margin: getMargin(left: 20, top: 17, bottom: 16),
                    onTap: () {}),
                title: AppbarSubtitle(
                    text: "lbl_pending".tr, margin: getMargin(left: 16)),
                styleType: Style.bgFillblueA200),
            body: loadData == true
                ? Container(
                    width: size.width,
                    padding: getPadding(left: 0, top: 24, right: 0, bottom: 24),
                    child: Stack(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                  width: double.infinity,
                                  padding: getPadding(all: 16),
                                  color: ColorConstant.whiteA700,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: getPadding(top: 1),
                                                child: Row(
                                                  children: [
                                                    Text('Title :',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSFUITextRegular17Gray600
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.08))),
                                                    Text(
                                                        details['title']
                                                            .toString(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSFUITextBold17Width700black
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.5))),
                                                  ],
                                                )),
                                            Row(
                                              children: [
                                                Padding(
                                                    padding:
                                                        getPadding(bottom: 1),
                                                    child: Text("lbl_date".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSFUITextRegular17Gray600
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.5)))),
                                                Padding(
                                                    padding: getPadding(
                                                        left: 4, bottom: 1),
                                                    child: Text(
                                                        dateFormat(detailsOne[
                                                                'created_at']
                                                            .toString()),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSFUITextRegular17
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.5))))
                                              ],
                                            )
                                          ],
                                        ),
                                        Padding(
                                            padding: getPadding(top: 8),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text('Details :',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtSFUITextRegular17Gray600
                                                              .copyWith(
                                                                  height:
                                                                      getVerticalSize(
                                                                          1.08))),
                                                      details['detail'][0]['is_multi_plot'] == 0
                                                          ? Padding(
                                                              padding: getPadding(
                                                                  top: 1),
                                                              child: Text(details['details'].toString(),
                                                                  overflow: TextOverflow
                                                                      .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtSFUITextBold17blueA200
                                                                      .copyWith(
                                                                          height: getVerticalSize(
                                                                              1.5))))
                                                          : Padding(
                                                              padding: getPadding(
                                                                  top: 1),
                                                              child: Text('',
                                                                  overflow: TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.left,
                                                                  style: AppStyle.txtSFUITextBold17blueA200.copyWith(height: getVerticalSize(1.5)))),
                                                    ],
                                                  ),
                                                ])),
                                        details['detail'][0]['is_multi_plot'] ==
                                                1
                                            ? Padding(
                                                padding: getPadding(top: 1),
                                                child: Text(
                                                    "NB: Red Text Khasra Number's Survey is pending, Green Text Khasra Number's Survey is Done",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtSFUITextBold17blueA200
                                                        .copyWith(
                                                            height:
                                                                getVerticalSize(
                                                                    1.5))))
                                            : Padding(
                                                padding: getPadding(top: 1),
                                                child: Text("",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtSFUITextBold17blueA200
                                                        .copyWith(
                                                            height:
                                                                getVerticalSize(1.5))))
                                      ])),
                              Container(
                                  width: double.infinity,
                                  margin: getMargin(top: 16),
                                  padding: getPadding(all: 16),
                                  color: ColorConstant.whiteA700,
                                  child: Column(
                                      // mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      left: 16,
                                                      top: 10,
                                                      bottom: 11),
                                                  child: Text(
                                                      'Surveyed Khasra #:',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSFUITextRegular15Black900
                                                          .copyWith(
                                                              height:
                                                                  getVerticalSize(
                                                                      1.5)))),
                                              details['detail'][0]['plot'] != null
                                                  ? Padding(
                                                      padding: getPadding(
                                                          left: 16,
                                                          top: 10,
                                                          bottom: 11),
                                                      child: Text(details['detail'][0]['plot']['khasara_no'].toString(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle.txtSFUITextRegular15Black900
                                                              .copyWith(
                                                                  height: getVerticalSize(
                                                                      1.5))))
                                                  : Padding(
                                                      padding: getPadding(
                                                          left: 16,
                                                          top: 10,
                                                          bottom: 11),
                                                      child: Text('N/A',
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: AppStyle.txtSFUITextRegular15Black900.copyWith(height: getVerticalSize(1.5))))
                                            ]),
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      left: 16,
                                                      top: 10,
                                                      bottom: 11),
                                                  child: Text('Village Name :',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSFUITextRegular15Black900
                                                          .copyWith(
                                                              height:
                                                                  getVerticalSize(
                                                                      1.5)))),
                                              details['detail'][0]['plot'] !=
                                                      null
                                                  ? Padding(
                                                      padding: getPadding(
                                                          left: 16,
                                                          top: 10,
                                                          bottom: 11),
                                                      child: Text(details['detail'][0]['plot']['village']['name'].toString(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle.txtSFUITextRegular15Black900
                                                              .copyWith(
                                                                  height: getVerticalSize(
                                                                      1.5))))
                                                  : details['detail'][0]['village_details'] !=
                                                          null
                                                      ? Padding(
                                                          padding: getPadding(
                                                              left: 16,
                                                              top: 10,
                                                              bottom: 11),
                                                          child: Text(details['detail'][0]['village_details']['name'].toString(), overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFUITextRegular15Black900.copyWith(height: getVerticalSize(1.5))))
                                                      : Padding(padding: getPadding(left: 16, top: 10, bottom: 11), child: Text('N/A', overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFUITextRegular15Black900.copyWith(height: getVerticalSize(1.5))))
                                            ]),
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      left: 16,
                                                      top: 10,
                                                      bottom: 11),
                                                  child: Text(
                                                      'Survey Assignee :',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSFUITextRegular15Black900
                                                          .copyWith(
                                                              height:
                                                                  getVerticalSize(
                                                                      1.5)))),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 16,
                                                      top: 10,
                                                      bottom: 11),
                                                  child: Text(
                                                      formatString(
                                                          details['user']
                                                                  ['username']
                                                              .toString()),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSFUITextRegular15Black900
                                                          .copyWith(
                                                              height:
                                                                  getVerticalSize(
                                                                      1.5))))
                                            ]),
                                      ])),
                              Padding(
                                padding: getPadding(top: 10),
                                child: Container(
                                  color: ColorConstant.whiteA700,
                                  child: Padding(
                                    padding: getPadding(
                                        left: 20,
                                        right: 20,
                                        top: 16,
                                        bottom: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: getPadding(top: 0),
                                          child: ElevatedButton.icon(
                                            onPressed: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) =>
                                              //         MapFromCompletedSurvey(
                                              //             surveId: details
                                              //                 .details!
                                              //                 .notification!
                                              //                 .detail![0]
                                              //                 .plot!
                                              //                 .khasaraNo
                                              //                 .toString(),
                                              //             notificationStatus:
                                              //                 notificationStatus,
                                              //             markersFromVisits:
                                              //                 details
                                              //                     .details!
                                              //                     .notification!
                                              //                     .visits,
                                              //             lat: details
                                              //                 .details!
                                              //                 .notification!
                                              //                 .detail![0]
                                              //                 .lat,
                                              //             lng: details
                                              //                 .details!
                                              //                 .notification!
                                              //                 .detail![0]
                                              //                 .lng),
                                              //   ),
                                              // );
                                            },
                                            icon: Icon(
                                              Icons.map_outlined,
                                              color: Colors.blue.shade200,
                                            ), //icon data for elevated button
                                            label: Text("Check On Map",
                                                style: AppStyle
                                                    .txtSFUITextRegular17
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.5))), //label text
                                          ),
                                        ),
                                        details['detail'][0]['plot']
                                                        ['khasara_no'] !=
                                                    '' &&
                                                (widget.notificationStatus ==
                                                        'open' ||
                                                    widget.notificationStatus ==
                                                        'running')
                                            ? Padding(
                                                padding: getPadding(
                                                  top: 0,
                                                ),
                                                child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    Get.toNamed(AppRoutes
                                                        .MapFromCompletedSurvey);
                                                  },
                                                  icon: Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.blue.shade200,
                                                  ), //icon data for elevated button
                                                  label: Text("Visit",
                                                      style: AppStyle
                                                          .txtSFUITextRegular17
                                                          .copyWith(
                                                              height: getVerticalSize(
                                                                  1.5))), //label text
                                                ))
                                            : Text(''),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: getPadding(top: 10),
                                  child: Container(
                                    color: ColorConstant.whiteA700,
                                    child: Padding(
                                        padding: getPadding(
                                            left: 20,
                                            right: 20,
                                            top: 16,
                                            bottom: 16),
                                        child: ListView.builder(
                                          itemCount: visits.length,
                                          //  itemCount: 5,
                                          physics: ScrollPhysics(),
                                          itemBuilder: (context, index) {
                                
                                            return Container(
                                                width: double.infinity,
                                                padding: getPadding(
                                                  all: 16,
                                                ),
                                                child: ExpansionTile(
                                                  title: Text(
                                                    "Visit #${numberingVisits(index)} :"
                                                      ), //header title
                                                  children: [
                                                    Container(
                                                      child: Text('text'),
                                                    )
                                                  ],
                                                ));
                                            // });
                                          },
                                        )),
                                  ),
                                ),
                              )
                       
                            ],
                          )
                        ]))
                : Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
