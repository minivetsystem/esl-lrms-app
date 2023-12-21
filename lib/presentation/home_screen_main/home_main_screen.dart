import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:intl/intl.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/search_one_screen/controller/search_one_controller.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_circleimage.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_bottom_bar.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';
// import 'package:vedanta_lrms/widgets/custom_button.dart';
// import 'package:vedanta_lrms/widgets/custom_icon_button.dart';
// import 'package:vedanta_lrms/widgets/custom_text_form_field.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchOneController>(
      init: SearchOneController(),
      builder: (searchOneController) => ColorfulSafeArea(
        color: ColorConstant.whiteA700,
        child: WillPopScope(
          onWillPop: () async {
            Future.delayed(const Duration(milliseconds: 1000), () {
              SystemNavigator.pop();
            });
            return false;
          },
          child: Center(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorConstant.lightGray,
                appBar: CustomAppBar(
                  height: getVerticalSize(
                    70.00,
                  ),
                       leadingWidth: 44,
          leading: InkWell(
            onTap: (){
               Navigator.pushNamed(context,'${AppRoutes.notificationScreen}');
           
            },
            child: Icon(Icons.notifications),
          ),
                  centerTitle: true,
                  title: Padding(
                    padding: getPadding(
                      left: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppbarSubtitle(
                          text: "lbl_welcome2".tr,
                        ),
                        AppbarSubtitle1(
                          text: "lbl_jerome_bell".tr,
                          margin: getMargin(
                            top: 1,
                            right: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    // AppbarCircleimage(
                    //   imagePath: ImageConstant.imgEllipse3,
                    //   margin: getMargin(
                    //     left: 20,
                    //     top: 11,
                    //     right: 20,
                    //     bottom: 19,
                    //   ),
                    // ),
                   Container(
                      margin: getMargin(
                        left: 20,
                       top: 11,
                         right: 20,
                         bottom: 19,
                       ),
                     child: Icon( Icons.settings,
                     ),
                   )
                  ],
                  styleType: Style.bgFillblueA200,
                ),
                body: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 170,
                            child: Container(
                              padding: getPadding(
                                all: 10,
                              ),
                              decoration: AppDecoration.outlineGray300.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder10,
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
                                              "offline_records".tr,
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
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "lbl_balco_plot".tr,
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

                                            Text(
                                              '1',
                                              style: TextStyle(
                                                color: ColorConstant.gray600,
                                                fontSize: getFontSize(
                                                  17,
                                                ),
                                                fontFamily: 'SF UI Text',
                                                fontWeight: FontWeight.w400,
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'lbl_balco_area'.tr,
                                              style: TextStyle(
                                                color: ColorConstant.gray600,
                                                fontSize: getFontSize(
                                                  17,
                                                ),
                                                fontFamily: 'SF UI Text',
                                                fontWeight: FontWeight.w400,
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '1',
                                              style: TextStyle(
                                                color: ColorConstant.gray600,
                                                fontSize: getFontSize(
                                                  17,
                                                ),
                                                fontFamily: 'SF UI Text',
                                                fontWeight: FontWeight.w400,
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'lbl_in_12_villages'.tr,
                                              style: TextStyle(
                                                color: ColorConstant.gray600,
                                                fontSize: getFontSize(
                                                  17,
                                                ),
                                                fontFamily: 'SF UI Text',
                                                fontWeight: FontWeight.w400,
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                            //more content
                                          ],
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.more_vert))),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 170,
                            child: Container(
                              padding: getPadding(
                                all: 10,
                              ),
                              decoration: AppDecoration.outlineGray300.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder10,
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
                                              "online_records".tr,
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
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "lbl_recorded_plot".tr,
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

                                            Text(
                                              '1',
                                              style: TextStyle(
                                                color: ColorConstant.gray600,
                                                fontSize: getFontSize(
                                                  17,
                                                ),
                                                fontFamily: 'SF UI Text',
                                                fontWeight: FontWeight.w400,
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'lbl_recorded_area'.tr,
                                              style: TextStyle(
                                                color: ColorConstant.gray600,
                                                fontSize: getFontSize(
                                                  17,
                                                ),
                                                fontFamily: 'SF UI Text',
                                                fontWeight: FontWeight.w400,
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '1',
                                              style: TextStyle(
                                                color: ColorConstant.gray600,
                                                fontSize: getFontSize(
                                                  17,
                                                ),
                                                fontFamily: 'SF UI Text',
                                                fontWeight: FontWeight.w400,
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'lbl_in_12_villages'.tr,
                                              style: TextStyle(
                                                color: ColorConstant.gray600,
                                                fontSize: getFontSize(
                                                  17,
                                                ),
                                                fontFamily: 'SF UI Text',
                                                fontWeight: FontWeight.w400,
                                                height: getVerticalSize(
                                                  1.08,
                                                ),
                                              ),
                                            ),
                                            //more content
                                          ],
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.more_vert))),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade300,),
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                onTap: () => {},
                                child: const Icon(
                                  Icons.tune,
                                  color: Colors.grey,
                                  
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 110,
                                  child: Container(
                                    padding: getPadding(
                                      all: 10,
                                    ),
                                    decoration:
                                        AppDecoration.outlineGray300.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder10,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            top: 1,
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "lbl_running_survey".tr,
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

                                              Text(
                                                '1',
                                                style: TextStyle(
                                                  color: ColorConstant.gray600,
                                                  fontSize: getFontSize(
                                                    17,
                                                  ),
                                                  fontFamily: 'SF UI Text',
                                                  fontWeight: FontWeight.w400,
                                                  height: getVerticalSize(
                                                    1.08,
                                                  ),
                                                ),
                                              ),

                                              //more content
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 110,
                                  child: Container(
                                    padding: getPadding(
                                      all: 10,
                                    ),
                                    decoration:
                                        AppDecoration.outlineGray300.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder10,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            top: 1,
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "lbl_closed_survey".tr,
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

                                              Text(
                                                '1',
                                                style: TextStyle(
                                                  color: ColorConstant.gray600,
                                                  fontSize: getFontSize(
                                                    17,
                                                  ),
                                                  fontFamily: 'SF UI Text',
                                                  fontWeight: FontWeight.w400,
                                                  height: getVerticalSize(
                                                    1.08,
                                                  ),
                                                ),
                                              ),

                                              //more content
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 110,
                                  child: Container(
                                    padding: getPadding(
                                      all: 10,
                                    ),
                                    decoration:
                                        AppDecoration.outlineGray300.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder10,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            top: 1,
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "lbl_total_survey".tr,
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

                                              Text(
                                                '1',
                                                style: TextStyle(
                                                  color: ColorConstant.gray600,
                                                  fontSize: getFontSize(
                                                    17,
                                                  ),
                                                  fontFamily: 'SF UI Text',
                                                  fontWeight: FontWeight.w400,
                                                  height: getVerticalSize(
                                                    1.08,
                                                  ),
                                                ),
                                              ),

                                              //more content
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
