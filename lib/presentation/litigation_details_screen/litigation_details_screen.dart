import 'dart:convert';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/data/services/notification.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';

class LitigationDetailsScreen extends StatefulWidget {
  final int? id;
  const LitigationDetailsScreen({super.key, this.id});

  @override
  State<LitigationDetailsScreen> createState() =>
      _LitigationDetailsScreenState();
}

class _LitigationDetailsScreenState extends State<LitigationDetailsScreen> {
  bool loadData = false;
  var title;
  var caseNo;
  var litigationDetails;
  List<dynamic> caseStatusList = [];
  List<dynamic> docsList = [];
  double? _progress;

  getLitigationDetails(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http
        .get(Uri.parse('${Constant.baseurl}case/case-details/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        litigationDetails = data['results']['details'];
        caseNo = litigationDetails['case_no'];
        caseStatusList = litigationDetails['history'];
        loadData = true;
      });
    } else {
      throw Exception();
    }
  }

  dateFormat(date) {
    DateTime dd = DateTime.parse(date);
    String formattedDate = DateFormat.yMMMd('en_US').format(dd);
// String dateWithT = d.substring(0, 8);
// DateTime dateTime = DateTime.parse(dateWithT);
    return formattedDate;
  }

  void downloadFile(url) async {
    FileDownloader.downloadFile(
        url: '${Constant.imageUrl}$url',
        onProgress: (name, progress) {
          setState(() {
            _progress = progress;
          });
          print(_progress);
        },
        onDownloadCompleted: (value) {
          print('path  $value ');

          NotificationsServices().sendNotification('File Downloaded', 'ok');
          setState(() {
            _progress = null;
          });
        });
  }

  @override
  void initState() {
    super.initState();
    getLitigationDetails(widget.id);
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
                centerTitle: true,
                leadingWidth: 44,
                leading: AppbarImage(
                    height: getSize(24.00),
                    width: getSize(24.00),
                    svgPath: ImageConstant.imgArrowleftWhiteA700,
                    margin: getMargin(left: 20, top: 17, bottom: 16),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                title: AppbarSubtitle(
                    text: "lbl_litigation_details".tr,
                    margin: getMargin(left: 16)),
                styleType: Style.bgFillblueA200),
            body: loadData == true
                ? SingleChildScrollView(
                  child: Container(
                      width: size.width,
                      padding: getPadding(left: 0, top: 24, right: 0, bottom: 24),
                      child: Stack(children: [
                        Column(children: [
                          SizedBox(
                            width: width - 20,
                            child: Container(
                              width: double.infinity,
                              padding: getPadding(all: 16),
                              color: ColorConstant.whiteA700,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: getPadding(top: 1),
                                      child: Text(caseNo,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSFUITextBold17Width700black
                                              .copyWith(
                                                  height: getVerticalSize(1.5)))),
                                  Padding(
                                      padding: getPadding(top: 1),
                                      child: Text(litigationDetails['title'],
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSFUITextBold17Width700black
                                              .copyWith(
                                                  height: getVerticalSize(1.5)))),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text('Case Type :',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17Gray600
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                      Padding(
                                          padding: getPadding(left: 4, bottom: 1),
                                          child: Text(
                                              litigationDetails['case_type']
                                                      ['name']
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSFUITextRegular17
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text('Details :',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17Gray600
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                      Padding(
                                          padding: getPadding(left: 4, bottom: 1),
                                          child: Text(
                                              litigationDetails['details']
                                                      ['details']
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSFUITextRegular17
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text('Case open At :',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17Gray600
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                      Padding(
                                          padding: getPadding(left: 4, bottom: 1),
                                          child: Text(
                                              dateFormat(litigationDetails[
                                                  'created_at']),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSFUITextRegular17
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text('Case Status :',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17Gray600
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                      Padding(
                                          padding: getPadding(left: 4, bottom: 1),
                                          child: Text(
                                              litigationDetails['case_status']
                                                  ['name'],
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSFUITextRegular17
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: width - 20,
                            child: Container(
                              width: double.infinity,
                              padding: getPadding(all: 16),
                              color: ColorConstant.whiteA700,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: getPadding(top: 1),
                                      child: Text('Responder Details',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSFUITextBold17Width700black
                                              .copyWith(
                                                  height: getVerticalSize(1.5)))),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text('Name :',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17Gray600
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                      Padding(
                                          padding: getPadding(left: 4, bottom: 1),
                                          child: Text(
                                              litigationDetails['details']
                                                      ['petitioner_name']
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSFUITextRegular17
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text('Address :',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17Gray600
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                      Padding(
                                          padding: getPadding(left: 4, bottom: 1),
                                          child: Text(
                                              litigationDetails['details']
                                                      ['details']
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSFUITextRegular17
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text('Phone No :',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17Gray600
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                      Padding(
                                          padding: getPadding(left: 4, bottom: 1),
                                          child: Text(
                                              dateFormat(litigationDetails[
                                                  'created_at']),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSFUITextRegular17
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: width - 20,
                            child: Container(
                              width: double.infinity,
                              padding: getPadding(all: 16),
                              color: ColorConstant.whiteA700,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: getPadding(top: 1),
                                      child: Text('Advocate Details',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSFUITextBold17Width700black
                                              .copyWith(
                                                  height: getVerticalSize(1.5)))),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text('Name :',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17Gray600
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text(
                                              '${litigationDetails['details']['advocate_name']}',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSFUITextRegular17
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text('Address :',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17Gray600
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                      Padding(
                                          padding: getPadding(left: 4, bottom: 1),
                                          child: Text(
                                              litigationDetails['details']
                                                  ['advocate_address'],
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSFUITextRegular17
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text('Phone No :',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17Gray600
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                      Padding(
                                          padding: getPadding(left: 4, bottom: 1),
                                          child: Text(
                                              '${litigationDetails['details']['advocate_phone_no']}',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSFUITextRegular17
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                         SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: width - 20,
                            child: Container(
                              width: double.infinity,
                              padding: getPadding(all: 16),
                              color: ColorConstant.whiteA700,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: getPadding(top: 1),
                                      child: Text('Petitioner Details',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSFUITextBold17Width700black
                                              .copyWith(
                                                  height: getVerticalSize(1.5)))),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text('Name :',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17Gray600
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text(
                                              '${litigationDetails['details']['petitioner_name']}',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSFUITextRegular17
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text('Address :',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17Gray600
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                      Padding(
                                          padding: getPadding(left: 4, bottom: 1),
                                          child: Text(
                                              litigationDetails['details']
                                                  ['petitioner_address'],
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSFUITextRegular17
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text('Phone No :',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17Gray600
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                      Padding(
                                          padding: getPadding(left: 4, bottom: 1),
                                          child: Text(
                                              '${litigationDetails['details']['petitioner_contact']}',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSFUITextRegular17
                                                  .copyWith(
                                                      height:
                                                          getVerticalSize(1.5)))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 300,
                            child: Expanded(
                              flex: 2,
                                child: ListView.builder(
                              itemCount: caseStatusList.length,
                              //  itemCount: 4,
                              physics: ScrollPhysics(),
                              itemBuilder: (context, index) {
                                final theme = Theme.of(context)
                                    .copyWith(dividerColor: Colors.transparent);
                                return Padding(
                                    padding: getPadding(top: 10),
                                    child: Container(
                                        color: ColorConstant.whiteA700,
                                        child: Padding(
                                            padding: getPadding(
                                                left: 20,
                                                right: 20,
                                                top: 16,
                                                bottom: 16),
                                            child: Container(
                                                width: double.infinity,
                                                // padding: getPadding(
                                                //   all: 16,
                                                // ),
                            
                                                child: Theme(
                                                  data: theme,
                                                  child: ExpansionTile(
                                                    title: Text(
                                                      '${caseStatusList[index]['status']['name']}',
                                                      style:
                                                          TextStyle(fontSize: 14),
                                                    ),
                            
                                                    //header title
                                                    children: [
                                                      Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                '${caseStatusList[index]['status']['name']} on ${dateFormat(caseStatusList[index]['status']['created_at'])}'),
                                                            Text(
                                                                'Action date on ${dateFormat(caseStatusList[index]['hearing_at'])}'),
                                                            Text(
                                                                'Case updated at ${caseStatusList[index]['user']['name']}'),
                                                            Text(
                                                                '${caseStatusList[index]['details']}'),
                                                            ListView.builder(
                                                                shrinkWrap: true,
                                                                itemCount: caseStatusList[
                                                                            index][
                                                                        'documents']
                                                                    .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          '${caseStatusList[index]['documents'][index]['actual_name']}'),
                                                                      IconButton(
                                                                        icon: Icon(Icons
                                                                            .download), // Icon for the button
                                                                        onPressed:
                                                                            () {
                                                                          downloadFile(caseStatusList[index]['documents']
                                                                                  [
                                                                                  index]
                                                                              [
                                                                              'url']);
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                })
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )))));
                                // });
                              },
                            )),
                          ),
                           
                        ])
                      ])),
                )
                : Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
