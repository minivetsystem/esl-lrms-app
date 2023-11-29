import 'package:colorful_safe_area/colorful_safe_area.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_page.dart';
import 'controller/history_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_icon_button.dart';

class HistoryOneScreen extends GetWidget<HistoryOneController> {
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
                    onTap: onTapArrowleft17),
                title: AppbarSubtitle(
                    text: "lbl_pending".tr, margin: getMargin(left: 16)),
                styleType: Style.bgFillblueA200),
            body: Container(
                width: size.width,
                padding: getPadding(left: 0, top: 24, right: 0, bottom: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                              width: double.infinity,
                              padding: getPadding(all: 16),
                              color: ColorConstant.whiteA700,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getPadding(top: 1),
                                            child: Text(
                                                "msg_details_of_booking".tr,
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
                                                child: Text("lbl_date".tr,
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
                                                    "lbl_20_dec_2022".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: getPadding(top: 1),
                                                  child: Text(
                                                      "lbl_large_truck".tr,
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
                                                padding: getPadding(right: 22),
                                                child: Row(
                                                  children: [
                                                    Text("lbl_time".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSFUITextRegular17Gray600
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.5))),
                                                    Padding(
                                                        padding:
                                                            getPadding(left: 2),
                                                        child: Text(
                                                            "lbl_10_30am".tr,
                                                            overflow:
                                                                TextOverflow
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
                                                ),
                                              )
                                            ])),
                                    Padding(
                                        padding: getPadding(top: 16, right: 20),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text("lbl_ref_id".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSFUITextRegular17Gray600
                                                          .copyWith(
                                                              height:
                                                                  getVerticalSize(
                                                                      1.08))),
                                                  Padding(
                                                      padding:
                                                          getPadding(left: 4),
                                                      child: Text("lbl_2023".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtSFUITextRegular17
                                                              .copyWith(
                                                                  height:
                                                                      getVerticalSize(
                                                                          1.5)))),
                                                ],
                                              ),
                                            ]))
                                  ])),
                          Container(
                              width: double.infinity,
                              margin: getMargin(top: 16),
                              padding: getPadding(all: 16),
                              color: ColorConstant.whiteA700,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgEllipse8,
                                          height: getSize(40.00),
                                          width: getSize(40.00),
                                          radius: BorderRadius.circular(
                                              getHorizontalSize(20.00))),
                                      Padding(
                                          padding: getPadding(
                                              left: 16, top: 10, bottom: 11),
                                          child: Text("lbl_driver_name".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular15Black900
                                                  .copyWith(
                                                      height: getVerticalSize(
                                                          1.5)))),
                                      Spacer(),
                                      CustomIconButton(
                                          height: 40,
                                          width: 40,
                                          shape: IconButtonShape.CircleBorder20,
                                          child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgCallWhiteA700)),
                                      CustomIconButton(
                                          height: 40,
                                          width: 40,
                                          margin: getMargin(left: 8),
                                          shape: IconButtonShape.CircleBorder20,
                                          child: CustomImageView(
                                              svgPath: ImageConstant.imgMobile))
                                    ]),
                                    Padding(
                                        padding: getPadding(top: 16),
                                        child: Text("lbl_vehicle_plat".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSFUITextBold17Width700black
                                                .copyWith(
                                                    height:
                                                        getVerticalSize(1.5)))),
                                    Padding(
                                        padding: getPadding(top: 5, bottom: 1),
                                        child: Text("lbl_rjgj6592".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSFUITextRegular15
                                                .copyWith(
                                                    height:
                                                        getVerticalSize(1.5))))
                                  ])),
                          Padding(
                            padding: getPadding(top: 10),
                            child: Container(
                              color: ColorConstant.whiteA700,
                              child: Padding(
                                padding: getPadding(
                                    left: 20, right: 20, top: 16, bottom: 16),
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 0),
                                        child: Row(children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgDestination,
                                              height: getSize(24.00),
                                              width: getSize(24.00)),
                                          Padding(
                                              padding:
                                                  getPadding(left: 16, top: 2),
                                              child: Text(
                                                  "msg_10_akerele_estate".tr,
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
                                        padding: getPadding(
                                          top: 17,
                                        ),
                                        child: Row(children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgLocationIcon,
                                              height: getSize(24.00),
                                              width: getSize(24.00)),
                                          Padding(
                                              padding:
                                                  getPadding(left: 16, top: 2),
                                              child: Text(
                                                  "6391 elgin st. celina, delaware 10299",
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(top: 10),
                            child: Container(
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
                                              Text("lbl_payment".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSFUITextBold17Width700black
                                                      .copyWith(
                                                          height:
                                                              getVerticalSize(
                                                                  1.08))),
                                              Container(
                                                width: getHorizontalSize(
                                                  66.00,
                                                ),
                                                margin: getMargin(
                                                  top: 12,
                                                ),
                                                padding: getPadding(
                                                  left: 8,
                                                  top: 3,
                                                  right: 8,
                                                  bottom: 3,
                                                ),
                                                decoration: AppDecoration
                                                    .txtFillblue50
                                                    .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .txtRoundedBorder4,
                                                ),
                                                child: Text(
                                                  "lbl_pending".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: AppStyle
                                                      .txtSFUITextRegular13blueA200
                                                      .copyWith(
                                                    height: getVerticalSize(
                                                      1.5,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ])),
                                    Padding(
                                        padding: getPadding(top: 15),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("lbl_card".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSFUITextRegular17Gray600
                                                      .copyWith(
                                                          height:
                                                              getVerticalSize(
                                                                  1.08))),
                                              Text("lbl_458_00".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSFUITextBold17blueA200
                                                      .copyWith(
                                                          height:
                                                              getVerticalSize(
                                                                  1.08)))
                                            ]))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: getPadding(left: 20, right: 20),
                        child: CustomButton(
                            alignment: Alignment.center,
                            onTap: () {
                              Get.toNamed(AppRoutes.trackDriverScreen);
                            },
                            height: 50,
                            width: 388,
                            text: "lbl_track_driver".tr),
                      ),
                    ])),
          )),
    );
  }

/*

 */

  onTapArrowleft17() {
    Get.back();
  }
}
