import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/foundation.dart';

import '../../widgets/custom_page.dart';
import '../home_four_container_screen/home_four_container_screen.dart';
import 'controller/select_truck_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';

// ignore: must_be_immutable
class SelectTruckScreen extends GetWidget<SelectTruckController> {
  SelectTruckController selectTruckController =
      Get.put(SelectTruckController());
  @override
  Widget build(BuildContext context) {
    return CustomPage(widget: get_page(context));
  }

// ignore: non_constant_identifier_names
  Widget get_page(context) {
    return GetBuilder<SelectTruckController>(
      init: SelectTruckController(),
      builder: (selectTruckController) => WillPopScope(
        onWillPop: () async {
          Get.off(HomeFourContainerScreen());
          return false;
        },
        child: ColorfulSafeArea(
            minimum: EdgeInsets.only(top: 20),
            color: ColorConstant.whiteA700,
            child: Scaffold(
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
                        onTap: onTapArrowleft7),
                    title: AppbarSubtitle(
                        text: "lbl_select_truck".tr,
                        margin: getMargin(left: 16)),
                    actions: [
                      AppbarImage(
                          height: getSize(24.00),
                          width: getSize(24.00),
                          svgPath: ImageConstant.imgFilterIcon,
                          margin: getMargin(
                              left: 20, top: 17, bottom: 16, right: 17),
                          onTap: () {
                            showModalBottomSheet(
                              constraints: BoxConstraints(
                                maxWidth: kIsWeb ? 428 : double.infinity,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      topLeft: Radius.circular(30))),
                              context: context,
                              builder: (context) {
                                return GetBuilder<SelectTruckController>(
                                  init: SelectTruckController(),
                                  builder: (selectTruckController) => Padding(
                                    padding: getPadding(top: 16, bottom: 16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text("lbl_large_truck".tr,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppStyle
                                                  .txtSFUITextBold19Width700black
                                                  .copyWith(
                                                      height: getVerticalSize(
                                                          1.2))),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            selectTruckController
                                                .setTruckcategory(1);
                                          },
                                          child: Padding(
                                            padding: getPadding(top: 23),
                                            child: Container(
                                              width: kIsWeb
                                                  ? 428
                                                  : double.infinity,
                                              height: getVerticalSize(32),
                                              color:
                                                  selectTruckController.id == 1
                                                      ? ColorConstant.blue
                                                      : ColorConstant.whiteA700,
                                              child: Center(
                                                child: Text("Small",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: selectTruckController
                                                                .id ==
                                                            1
                                                        ? AppStyle
                                                            .txtSFUITextRegular17WhiteA700
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.2))
                                                        : AppStyle
                                                            .txtSFUITextBold17
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.2))),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            selectTruckController
                                                .setTruckcategory(2);
                                          },
                                          child: Padding(
                                            padding: getPadding(top: 0),
                                            child: Container(
                                              width: kIsWeb
                                                  ? 428
                                                  : double.infinity,
                                              color:
                                                  selectTruckController.id == 2
                                                      ? ColorConstant.blue
                                                      : ColorConstant.whiteA700,
                                              height: getVerticalSize(32),
                                              child: Center(
                                                child: Text("Medium",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: selectTruckController
                                                                .id ==
                                                            2
                                                        ? AppStyle
                                                            .txtSFUITextRegular17WhiteA700
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.2))
                                                        : AppStyle
                                                            .txtSFUITextBold17
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.2))),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            selectTruckController
                                                .setTruckcategory(3);
                                          },
                                          child: Padding(
                                            padding: getPadding(top: 0),
                                            child: Container(
                                              color:
                                                  selectTruckController.id == 3
                                                      ? ColorConstant.blue
                                                      : ColorConstant.whiteA700,
                                              height: getVerticalSize(32),
                                              width: kIsWeb
                                                  ? 428
                                                  : double.infinity,
                                              child: Center(
                                                child: Text("Large",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: selectTruckController
                                                                .id ==
                                                            3
                                                        ? AppStyle
                                                            .txtSFUITextRegular17WhiteA700
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.2))
                                                        : AppStyle
                                                            .txtSFUITextBold17
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.2))),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          })
                    ],
                    styleType: Style.bgFillblueA200),
                body: Container(
                    width: size.width,
                    padding: getPadding(top: 5, bottom: 5),
                    child: ListView(
                      children: [
                        Padding(
                          padding: getPadding(top: 5, bottom: 5),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.truckDetailScreen);
                            },
                            child: Container(
                                color: ColorConstant.whiteA700,
                                width: double.infinity,
                                child: Padding(
                                  padding: getPadding(
                                      left: 20, right: 20, top: 8, bottom: 8),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: getSize(101.00),
                                              width: getSize(101.00),
                                              decoration: AppDecoration
                                                  .fillGray600
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder4),
                                              child: CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath: ImageConstant
                                                    .img3delectrictruckstreet,
                                                height: getSize(101.00),
                                                width: getSize(101.00),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(4.00)),
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(left: 16),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("lbl_large_truck".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSFUITextBold17Width700black
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.2))),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 8),
                                                        child: Row(children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      bottom:
                                                                          3),
                                                              child: Text(
                                                                  "lbl_245_00"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtSFUITextRegular17Gray600
                                                                      .copyWith(
                                                                          height:
                                                                              getVerticalSize(1.08)))),
                                                        ])),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 6),
                                                        child: Text(
                                                            "msg_driver_jane_cooper"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtSFUITextRegular17
                                                                .copyWith(
                                                                    height: getVerticalSize(
                                                                        1.08))))
                                                  ]),
                                            )
                                          ],
                                        ),
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgrightArrow,
                                            height: getSize(20.00),
                                            width: getSize(20.00),
                                            margin:
                                                getMargin(left: 0, right: 0))
                                      ]),
                                )),
                          ),
                        ),
                        Padding(
                          padding: getPadding(top: 5, bottom: 5),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.truckDetailScreen);
                            },
                            child: Container(
                                width: double.infinity,
                                color: ColorConstant.whiteA700,
                                child: Padding(
                                  padding: getPadding(
                                      left: 20, right: 20, top: 8, bottom: 8),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: getSize(101.00),
                                              width: getSize(101.00),
                                              decoration: AppDecoration
                                                  .fillGray600
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder4),
                                              child: CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath: ImageConstant
                                                    .img3delectrictruckstreet101x101,
                                                height: getSize(101.00),
                                                width: getSize(101.00),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(4.00)),
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(left: 16),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("lbl_large_truck".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSFUITextBold17Width700black
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.2))),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 8),
                                                        child: Row(children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      bottom:
                                                                          3),
                                                              child: Text(
                                                                  "lbl_245_00"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtSFUITextRegular17Gray600
                                                                      .copyWith(
                                                                          height:
                                                                              getVerticalSize(1.08)))),
                                                        ])),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 5),
                                                        child: Text(
                                                            "msg_driver_john_yat"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtSFUITextRegular17
                                                                .copyWith(
                                                                    height: getVerticalSize(
                                                                        1.08))))
                                                  ]),
                                            )
                                          ],
                                        ),
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgrightArrow,
                                            height: getSize(20.00),
                                            width: getSize(20.00),
                                            margin:
                                                getMargin(left: 0, right: 0))
                                      ]),
                                )),
                          ),
                        ),
                        Padding(
                          padding: getPadding(top: 5, bottom: 5),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.truckDetailScreen);
                            },
                            child: Container(
                                width: double.infinity,
                                color: ColorConstant.whiteA700,
                                child: Padding(
                                  padding: getPadding(
                                      left: 20, right: 20, top: 8, bottom: 8),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: getSize(101.00),
                                              width: getSize(101.00),
                                              decoration: AppDecoration
                                                  .fillGray600
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder4),
                                              child: CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath: ImageConstant
                                                    .img3delectrictruckstreet1,
                                                height: getSize(101.00),
                                                width: getSize(101.00),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(4.00)),
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(left: 16),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("lbl_large_truck".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSFUITextBold17Width700black
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.2))),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 8),
                                                        child: Row(children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      bottom:
                                                                          3),
                                                              child: Text(
                                                                  "lbl_245_00"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtSFUITextRegular17Gray600
                                                                      .copyWith(
                                                                          height:
                                                                              getVerticalSize(1.08)))),
                                                        ])),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 6),
                                                        child: Text(
                                                            "lbl_driver_robert"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtSFUITextRegular17
                                                                .copyWith(
                                                                    height: getVerticalSize(
                                                                        1.08))))
                                                  ]),
                                            )
                                          ],
                                        ),
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgrightArrow,
                                            height: getSize(20.00),
                                            width: getSize(20.00),
                                            margin:
                                                getMargin(left: 0, right: 0))
                                      ]),
                                )),
                          ),
                        ),
                        Padding(
                          padding: getPadding(top: 5, bottom: 5),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.truckDetailScreen);
                            },
                            child: Container(
                                width: double.infinity,
                                color: ColorConstant.whiteA700,
                                child: Padding(
                                  padding: getPadding(
                                      left: 20, right: 20, top: 8, bottom: 8),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: getSize(101.00),
                                              width: getSize(101.00),
                                              decoration: AppDecoration
                                                  .fillGray600
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder4),
                                              child: CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath: ImageConstant
                                                    .img3delectrictruckstreet4,
                                                height: getSize(101.00),
                                                width: getSize(101.00),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(4.00)),
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(left: 16),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("lbl_large_truck".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSFUITextBold17Width700black
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.2))),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 8),
                                                        child: Row(children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      bottom:
                                                                          3),
                                                              child: Text(
                                                                  "lbl_245_00"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtSFUITextRegular17Gray600
                                                                      .copyWith(
                                                                          height:
                                                                              getVerticalSize(1.08)))),
                                                        ])),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 6),
                                                        child: Text(
                                                            "msg_driver_jacob_jones"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtSFUITextRegular17
                                                                .copyWith(
                                                                    height: getVerticalSize(
                                                                        1.08))))
                                                  ]),
                                            )
                                          ],
                                        ),
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgrightArrow,
                                            height: getSize(20.00),
                                            width: getSize(20.00),
                                            margin:
                                                getMargin(left: 0, right: 0))
                                      ]),
                                )),
                          ),
                        ),
                        Padding(
                          padding: getPadding(top: 5, bottom: 5),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.truckDetailScreen);
                            },
                            child: Container(
                                width: double.infinity,
                                color: ColorConstant.whiteA700,
                                child: Padding(
                                  padding: getPadding(
                                      left: 20, right: 20, top: 8, bottom: 8),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: getSize(101.00),
                                              width: getSize(101.00),
                                              decoration: AppDecoration
                                                  .fillGray600
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder4),
                                              child: CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath: ImageConstant
                                                    .img3delectrictruckstreet5,
                                                height: getSize(101.00),
                                                width: getSize(101.00),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(4.00)),
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(left: 16),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("lbl_large_truck".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSFUITextBold17Width700black
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.2))),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 8),
                                                        child: Row(children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      bottom:
                                                                          3),
                                                              child: Text(
                                                                  "lbl_245_00"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtSFUITextRegular17Gray600
                                                                      .copyWith(
                                                                          height:
                                                                              getVerticalSize(1.08)))),
                                                        ])),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 6),
                                                        child: Text(
                                                            "msg_driver_jacob_jones"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtSFUITextRegular17
                                                                .copyWith(
                                                                    height: getVerticalSize(
                                                                        1.08))))
                                                  ]),
                                            )
                                          ],
                                        ),
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgrightArrow,
                                            height: getSize(20.00),
                                            width: getSize(20.00),
                                            margin:
                                                getMargin(left: 0, right: 0))
                                      ]),
                                )),
                          ),
                        ),
                        Padding(
                          padding: getPadding(top: 5, bottom: 5),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.truckDetailScreen);
                            },
                            child: Container(
                                width: double.infinity,
                                color: ColorConstant.whiteA700,
                                child: Padding(
                                  padding: getPadding(
                                      left: 20, right: 20, top: 8, bottom: 8),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: getSize(101.00),
                                              width: getSize(101.00),
                                              decoration: AppDecoration
                                                  .fillGray600
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder4),
                                              child: CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath: ImageConstant
                                                    .img3delectrictruckstreet2,
                                                height: getSize(101.00),
                                                width: getSize(101.00),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(4.00)),
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(left: 16),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("lbl_large_truck".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSFUITextBold17Width700black
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.2))),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 8),
                                                        child: Row(children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      bottom:
                                                                          3),
                                                              child: Text(
                                                                  "lbl_245_00"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtSFUITextRegular17Gray600
                                                                      .copyWith(
                                                                          height:
                                                                              getVerticalSize(1.08)))),
                                                        ])),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 6),
                                                        child: Text(
                                                            "msg_driver_jacob_jones"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtSFUITextRegular17
                                                                .copyWith(
                                                                    height: getVerticalSize(
                                                                        1.08))))
                                                  ]),
                                            )
                                          ],
                                        ),
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgrightArrow,
                                            height: getSize(20.00),
                                            width: getSize(20.00),
                                            margin:
                                                getMargin(left: 0, right: 0))
                                      ]),
                                )),
                          ),
                        ),
                      ],
                    )))),
      ),
    );
  }

  onTapArrowleft7() {
    Get.off(HomeFourContainerScreen());
  }
}
