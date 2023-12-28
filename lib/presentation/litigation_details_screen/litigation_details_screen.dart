import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vedanta_lrms/core/app_export.dart';
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
                ? Container(
                    width: size.width,
                    padding: getPadding(left: 0, top: 24, right: 0, bottom: 24),
                    child: Stack(
                        children: [
                          Column(children: [
                            Container(
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
                                                        height: getVerticalSize(
                                                            1.5)))),
                                        Padding(
                                            padding: getPadding(top: 1),
                                            child: Text(
                                                litigationDetails['title'],
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUITextBold17Width700black
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.5)))),
                                        Row(
                                          children: [
                                            Padding(
                                                padding: getPadding(bottom: 1),
                                                child: Text('Case Type :',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
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
                                                    
                                                        litigationDetails[
                                                                'case_type']['name']
                                                            .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtSFUITextRegular17
                                                        .copyWith(
                                                            height:
                                                                getVerticalSize(
                                                                    1.5)))),

                                          ],
                                        ),
                                            Row(
                                          children: [
                                            Padding(
                                                padding: getPadding(bottom: 1),
                                                child: Text('Details :',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
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
                                                    
                                                        litigationDetails[
                                                                'details']['details']
                                                            .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtSFUITextRegular17
                                                        .copyWith(
                                                            height:
                                                                getVerticalSize(
                                                                    1.5)))),
                                                                    
                                          ],
                                        ),
                                                 Row(
                                          children: [
                                            Padding(
                                                padding: getPadding(bottom: 1),
                                                child: Text('Case open At :',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
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
                                                    
                                                        dateFormat(litigationDetails[
                                                        'created_at']
                                                        ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtSFUITextRegular17
                                                        .copyWith(
                                                            height:
                                                                getVerticalSize(
                                                                    1.5)))),
                                                                    
                                          ],
                                        ),
                                                      Row(
                                          children: [
                                            Padding(
                                                padding: getPadding(bottom: 1),
                                                child: Text('Case Status :',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
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
                                                      litigationDetails[
                                                        'case_status']['name']
                                                        ,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtSFUITextRegular17
                                                        .copyWith(
                                                            height:
                                                                getVerticalSize(
                                                                    1.5)))),
                                                                    
                                          ],
                                        )
                                      ],
                                    ),
                                    
                                
                                )
                          ])
                        ]))
                : Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
