// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:vedanta_lrms/data/apiClient/api_client.dart';
import 'package:vedanta_lrms/presentation/history_one_screen/history_one_screen.dart';
import 'package:vedanta_lrms/presentation/survey_list_page/models/survey_list_model.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';

import '../../widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class SurveyListPage extends StatefulWidget {
  const SurveyListPage({super.key});

  @override
  State<SurveyListPage> createState() => _SurveyListPageState();
}

class _SurveyListPageState extends State<SurveyListPage> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;
  List<String> messages = List.generate(20, (index) => 'Message $index');

  @override
  void initState() {
    super.initState();

    // Start auto-scrolling every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      // _scrollToBottom();
    });
  }

  @override
  void dispose() {
    // Dispose of the timer and scroll controller
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  dateFormat(date) {
    DateTime dd = DateTime.parse(date);
    String formattedDate = DateFormat.yMMMd('en_US').format(dd);
// String dateWithT = d.substring(0, 8);
// DateTime dateTime = DateTime.parse(dateWithT);
    return formattedDate;
  }

  // Method to scroll to the bottom of the list
  // void _scrollToBottom() {
  //   _scrollController.animateTo(
  //     _scrollController.position.maxScrollExtent,
  //     duration: Duration(seconds: 5),
  //     curve: Curves.easeInOut,
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return CustomPage(widget: get_page(context));
  }

  Widget get_page(context) {
    return WillPopScope(
        onWillPop: () async {
          Future.delayed(const Duration(milliseconds: 1000), () {
            SystemNavigator.pop();
          });
          return false;
        },
        child: ColorfulSafeArea(
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
                        onTap: () {
                          Navigator.pop(context);
                        }),
                    title: AppbarSubtitle(
                        text: "lbl_survey_list".tr,
                        margin: getMargin(left: 16)),
                    styleType: Style.bgFillblueA200),
                body: FutureBuilder<NotificationResponse>(
                  future: ApiClient().getSurveyList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      print(snapshot);
                      return Text('Error: ${snapshot.error}');
                    } else {
                      print(snapshot);
                      final ListSurvey = snapshot.data!;
                      print(ListSurvey);
                      return Column(children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          width: double.infinity,
                          padding: getPadding(
                            all: 16,
                          ),
                          decoration: AppDecoration.outlineGray300.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder4,
                          ),
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 16,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              left: 16,
                                              top: 3,
                                            ),
                                            child: Text(
                                              "${ListSurvey.results!.openSurvey.toString()}",
                                              //  "ListSurvey.results",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17
                                                  .copyWith(
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(
                                              left: 16,
                                              top: 3,
                                            ),
                                            child: Text(
                                              "Open",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17
                                                  .copyWith(
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        top: 16,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              left: 16,
                                              top: 3,
                                            ),
                                            child: Text(
                                              "${ListSurvey.results!.totalRunning.toString()}",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17
                                                  .copyWith(
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(
                                              left: 16,
                                              top: 3,
                                            ),
                                            child: Text(
                                              "Running",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17
                                                  .copyWith(
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        top: 16,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              left: 16,
                                              top: 3,
                                            ),
                                            child: Text(
                                              "${ListSurvey.results!.closedSurvey.toString()}",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17
                                                  .copyWith(
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(
                                              left: 16,
                                              top: 3,
                                            ),
                                            child: Text(
                                              "Closed",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17
                                                  .copyWith(
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        top: 16,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              left: 16,
                                              top: 3,
                                            ),
                                            child: Text(
                                              "${ListSurvey.results!.totalCount.toString()}",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17
                                                  .copyWith(
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(
                                              left: 16,
                                              top: 3,
                                            ),
                                            child: Text(
                                              "Total",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17
                                                  .copyWith(
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                          // controller: _scrollController,
                          itemCount:
                              ListSurvey.results!.userNotifications!.length,
                          //  itemCount: 50,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              padding: getPadding(
                                all: 16,
                              ),
                              decoration: AppDecoration.outlineGray300.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder4,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      top: 1,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              ListSurvey
                                                  .results!
                                                  .userNotifications![index]
                                                  .notification!
                                                  .title
                                                  .toString(),
                                              // ' ListSurvey.results.',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextBold17Width700black
                                                  .copyWith(
                                                height: getVerticalSize(
                                                  1.5,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              ListSurvey
                                                  .results!
                                                  .userNotifications![index]
                                                  .notification!
                                                  .details
                                                  .toString(),
                                              style: TextStyle(
                                                color: ColorConstant.gray600,
                                                fontSize: getFontSize(
                                                  17,
                                                ),
                                                fontFamily: 'SF UI Text',
                                                fontWeight: FontWeight.w400,
                                                height: getVerticalSize(
                                                  1.5,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                top: 15,
                                              ),
                                              child: Row(
                                                children: [
                                                  CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgLocationGray600,
                                                    height: getSize(
                                                      24.00,
                                                    ),
                                                    width: getSize(
                                                      24.00,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      left: 16,
                                                      top: 1,
                                                      bottom: 1,
                                                    ),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: ListSurvey
                                                                .results!
                                                                .userNotifications![
                                                                    index]
                                                                .notification!
                                                                .detail![0]
                                                                .villageDetails!
                                                                .name
                                                                .toString(),
                                                            style: AppStyle
                                                                .txtSFUITextRegular17
                                                                .copyWith(
                                                              height:
                                                                  getVerticalSize(
                                                                1.08,
                                                              ),
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '  Surveyed By  ',
                                                            style: TextStyle(
                                                              color:
                                                                  ColorConstant
                                                                      .gray600,
                                                              fontSize:
                                                                  getFontSize(
                                                                17,
                                                              ),
                                                              fontFamily:
                                                                  'SF UI Text',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height:
                                                                  getVerticalSize(
                                                                1.5,
                                                              ),
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: ListSurvey
                                                                .results!
                                                                .userNotifications![
                                                                    index]
                                                                .notification!
                                                                .user!
                                                                .name
                                                                .toString(),
                                                            style: AppStyle
                                                                .txtSFUITextRegular17
                                                                .copyWith(
                                                              height:
                                                                  getVerticalSize(
                                                                1.08,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),

                                                    // Text(
                                                    //   "Naperville",
                                                    //   overflow:
                                                    //       TextOverflow.ellipsis,
                                                    //   textAlign: TextAlign.left,
                                                    //   style: AppStyle
                                                    //       .txtSFUITextRegular17
                                                    //       .copyWith(
                                                    //     height: getVerticalSize(
                                                    //       1.08,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                top: 16,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.calendar_month,
                                                      color:
                                                          Colors.grey.shade400,
                                                      size: 20),
                                                  Padding(
                                                    padding: getPadding(
                                                      left: 16,
                                                      top: 3,
                                                    ),
                                                    child: Text(
                                                      dateFormat(ListSurvey
                                                          .results!
                                                          .userNotifications![
                                                              index]
                                                          .createdAt
                                                          .toString()),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSFUITextRegular17
                                                          .copyWith(
                                                        height: getVerticalSize(
                                                          1.08,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 14,
                                            bottom: 90,
                                          ),
                                          child: Text(
                                            ListSurvey
                                                .results!
                                                .userNotifications![index]
                                                .notificationStatus
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSFUITextBold17blueA200
                                                .copyWith(
                                              height: getVerticalSize(
                                                1.08,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 16,
                                    ),
                                    child: Row(
                                      children: [
                                        CustomButton(
                                            onTap: () {
                                              // Get.toNamed(
                                              //     AppRoutes.historyOneScreen);
                                              print(
                                                ListSurvey
                                                    .results!
                                                    .userNotifications![index]
                                                    .id
                                                    .toString(),
                                              );
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HistoryOneScreen(
                                                          id: ListSurvey
                                                              .results!
                                                              .userNotifications![
                                                                  index]
                                                              .id),
                                                ),
                                              );
                                            },
                                            shape: ButtonShape.RoundedBorder4,
                                            height: 36,
                                            width: 135,
                                            text: "lbl_view_details".tr,
                                            margin: getMargin(bottom: 1),
                                            variant:
                                                ButtonVariant.OutlineblueA200_2,
                                            padding: ButtonPadding.PaddingAll9,
                                            fontStyle:
                                                ButtonFontStyle.SFUITextBold14),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ))
                      ]);
                    }
                  },
                ))));
  }
}
