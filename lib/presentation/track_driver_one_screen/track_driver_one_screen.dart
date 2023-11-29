import 'package:colorful_safe_area/colorful_safe_area.dart';

import '../../widgets/custom_page.dart';
import 'controller/track_driver_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_icon_button.dart';

class TrackDriverOneScreen extends GetWidget<TrackDriverOneController> {
  @override
  Widget build(BuildContext context) {
    return CustomPage(widget: get_page());
  }

  // ignore: non_constant_identifier_names
  Widget get_page() {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
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
                        Get.back();
                      }),
                  title: AppbarSubtitle(
                      text: "lbl_tracking".tr, margin: getMargin(left: 16)),
                  styleType: Style.bgFillblueA200),
              body: Container(
                  width: size.width,
                  padding: getPadding(left: 0, top: 10, right: 0, bottom: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          color: ColorConstant.whiteA700,
                          child: Padding(
                            padding: getPadding(
                                left: 20, right: 20, top: 16, bottom: 16),
                            child: Column(
                              children: [
                                Padding(
                                    padding: getPadding(top: 0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: getPadding(top: 1),
                                              child: Text("lbl_large_truck".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSFUITextBold17blueA200
                                                      .copyWith(
                                                          height:
                                                              getVerticalSize(
                                                                  1.5)))),
                                          Padding(
                                              padding: getPadding(bottom: 1),
                                              child: Text("lbl_one_route".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSFUITextRegular17
                                                      .copyWith(
                                                          height:
                                                              getVerticalSize(
                                                                  1.5))))
                                        ])),
                                Padding(
                                    padding: getPadding(top: 7),
                                    child: Row(children: [
                                      Text("lbl_ref_id".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSFUITextRegular17Gray600
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(1.5))),
                                      Padding(
                                          padding: getPadding(left: 4),
                                          child: Text("lbl_2023".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular17
                                                  .copyWith(
                                                      height: getVerticalSize(
                                                          1.5)))),
                                      Spacer(),
                                      Padding(
                                          padding: getPadding(top: 2),
                                          child: Text(
                                              "msg_last_update_4_minuts".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular15
                                                  .copyWith(
                                                      height: getVerticalSize(
                                                          1.5))))
                                    ])),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(top: 10),
                          child: Container(
                            color: ColorConstant.whiteA700,
                            width: double.infinity,
                            child: Padding(
                              padding: getPadding(
                                  top: 16, left: 20, right: 20, bottom: 16),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: getPadding(top: 0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("lbl_route".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUITextBold17Width700black
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.5))),
                                            Text("lbl_eta_30_mins".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUITextRegular17Gray600
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.5)))
                                          ])),
                                  Padding(
                                      padding: getPadding(top: 16),
                                      child: Row(children: [
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgLocationGray600,
                                            height: getSize(24.00),
                                            width: getSize(24.00)),
                                        Padding(
                                            padding:
                                                getPadding(left: 16, top: 2),
                                            child: Text(
                                                "msg_10_akerele_estate".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUITextRegular17
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.5))))
                                      ])),
                                  Padding(
                                      padding: getPadding(top: 16),
                                      child: Row(children: [
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgLocationGray60024x24,
                                            height: getSize(24.00),
                                            width: getSize(24.00)),
                                        Padding(
                                            padding:
                                                getPadding(left: 16, top: 2),
                                            child: Text(
                                                "msg_9_vector_olayet".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUITextRegular17
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.5))))
                                      ])),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(top: 10),
                          child: Container(
                            color: ColorConstant.whiteA700,
                            width: double.infinity,
                            child: Padding(
                              padding: getPadding(
                                  right: 20, left: 20, top: 16, bottom: 16),
                              child: Column(
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getPadding(bottom: 1),
                                            child: Text("lbl_date2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUITextBold17
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.5)))),
                                        Padding(
                                            padding: getPadding(top: 1),
                                            child: Text("lbl_20_12_2022".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUITextRegular17Gray600
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.5))))
                                      ]),
                                  Padding(
                                    padding: getPadding(top: 16),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgEllipse8,
                                                        height: getSize(40.00),
                                                        width: getSize(40.00),
                                                        radius: BorderRadius
                                                            .circular(
                                                                getHorizontalSize(
                                                                    20.00))),
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 16,
                                                            top: 0,
                                                            bottom: 0),
                                                        child: Text(
                                                            "Jane Cooper",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyle
                                                                .txtSFUITextRegular15Black900
                                                                .copyWith(
                                                                    height: getVerticalSize(
                                                                        1.5)))),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    CustomIconButton(
                                                        height: 40,
                                                        width: 40,
                                                        shape: IconButtonShape
                                                            .CircleBorder20,
                                                        child: CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgCallWhiteA700)),
                                                    CustomIconButton(
                                                        onTap: () {
                                                          Get.toNamed(AppRoutes
                                                              .truckDetailTwoScreen);
                                                          // Get.toNamed(AppRoutes.truckDetailOneScreen);
                                                        },
                                                        height: 40,
                                                        width: 40,
                                                        margin:
                                                            getMargin(left: 0),
                                                        shape: IconButtonShape
                                                            .CircleBorder20,
                                                        child: CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgMobile))
                                                  ],
                                                )
                                              ]),
                                          Padding(
                                              padding: getPadding(top: 16),
                                              child: Text("lbl_vehicle_plat".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSFUITextBold17Width700black
                                                      .copyWith(
                                                          height:
                                                              getVerticalSize(
                                                                  1.5)))),
                                          Padding(
                                              padding:
                                                  getPadding(top: 5, bottom: 1),
                                              child: Text("lbl_rjgj6592".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSFUITextRegular15
                                                      .copyWith(
                                                          height:
                                                              getVerticalSize(
                                                                  1.5))))
                                        ]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(top: 10),
                          child: Container(
                            width: double.infinity,
                            color: ColorConstant.whiteA700,
                            child: Padding(
                              padding: getPadding(
                                  top: 16, bottom: 16, left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("lbl_live_map".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtSFUITextBold17Width700black
                                          .copyWith(
                                              height: getVerticalSize(1.5))),
                                  Container(
                                      height: getVerticalSize(272.00),
                                      width: double.infinity,
                                      margin: getMargin(top: 15),
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgImage6,
                                                height: getVerticalSize(272.00),
                                                width: double.infinity,
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(4.00)),
                                                alignment: Alignment.center),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                    width: double.infinity,
                                                    padding: getPadding(
                                                        left: 0,
                                                        top: 124,
                                                        right: 0,
                                                        bottom: 124),
                                                    decoration: AppDecoration
                                                        .fillBlack9007f
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder4),
                                                    child: Padding(
                                                        padding:
                                                            getPadding(top: 2),
                                                        child: Text(
                                                            "lbl_open".tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyle
                                                                .txtSFUITextBold17WhiteA700
                                                                .copyWith(
                                                                    height:
                                                                        getVerticalSize(1.5))))))
                                          ])),
                                ],
                              ),
                            ),
                          ),
                        )
                      ])))),
    );
  }

  onTapArrowleft19() {
    Get.back();
  }
}
