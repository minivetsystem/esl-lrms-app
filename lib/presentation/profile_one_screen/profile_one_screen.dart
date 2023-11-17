import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';
import 'package:truck_booking_app/presentation/profile_one_screen/setting_option_screen.dart';

import '../../support_screen/support_screen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_page.dart';
import '../profile_dialog/controller/profile_controller.dart';
import '../profile_dialog/profile_dialog.dart';
import 'controller/profile_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_image.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:truck_booking_app/widgets/app_bar/custom_app_bar.dart';

class ProfileOneScreen extends GetWidget<ProfileOneController> {
  @override
  Widget build(BuildContext context) {
    return CustomPage(widget: get_page(context));
  }

// ignore: non_constant_identifier_names
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
              backgroundColor: ColorConstant.lightGray,
              appBar: CustomAppBar(
                  height: getVerticalSize(57.00),
                  leadingWidth: 44,
                  leading: AppbarImage(
                      height: getSize(24.00),
                      width: getSize(24.00),
                      svgPath: ImageConstant.imgArrowleftWhiteA700,
                      margin: getMargin(left: 20, top: 17, bottom: 16),
                      onTap: onTapArrowleft10),
                  title: AppbarSubtitle(
                      text: "lbl_profile".tr, margin: getMargin(left: 16)),
                  styleType: Style.bgFillblueA200),
              body: Container(
                  width: size.width,
                  padding: getPadding(left: 0, top: 0, right: 0, bottom: 0),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(top: 10),
                              child: Container(
                                width: double.infinity,
                                color: ColorConstant.whiteA700,
                                child: Padding(
                                  padding: getPadding(top: 16, bottom: 16),
                                  child: Column(
                                    children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgEllipse7,
                                          height: getSize(100.00),
                                          width: getSize(100.00),
                                          radius: BorderRadius.circular(
                                              getHorizontalSize(50.00))),
                                      Padding(
                                          padding: getPadding(top: 10),
                                          child: Text("lbl_lorem_ipsum".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextBold17Width700black
                                                  .copyWith(
                                                      height: getVerticalSize(
                                                          1.5)))),
                                      Padding(
                                          padding: getPadding(top: 4),
                                          child: Text(
                                              "msg_loremipsum_gmail_com2".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular15
                                                  .copyWith(
                                                      height: getVerticalSize(
                                                          1.12)))),
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
                                      left: 20, right: 20, top: 17, bottom: 17),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(AppRoutes
                                              .viewInformationOneScreen);
                                        },
                                        child: Padding(
                                            padding: getPadding(top: 0),
                                            child: Container(
                                              color: ColorConstant.whiteA700,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgProfileIcon,
                                                        ),
                                                        Padding(
                                                          padding: getPadding(
                                                              left: 16),
                                                          child: Text(
                                                            "lbl_my_profile".tr,
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
                                                                            1.5)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgrightArrow,
                                                        height: getSize(24.00),
                                                        width: getSize(24.00))
                                                  ]),
                                            )),
                                      ),
                                      Container(
                                          height: getVerticalSize(1.00),
                                          width: double.infinity,
                                          margin: getMargin(top: 16),
                                          decoration: BoxDecoration(
                                              color: ColorConstant.gray300,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getHorizontalSize(
                                                          1.00)))),
                                      Padding(
                                          padding: getPadding(top: 16),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgTrackPackegeIcon,
                                                    ),
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 16),
                                                        child: Text(
                                                            "lbl_track_package"
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
                                                                        1.08)))),
                                                  ],
                                                ),
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgrightArrow,
                                                    height: getSize(24.00),
                                                    width: getSize(24.00))
                                              ])),
                                      Container(
                                          height: getVerticalSize(1.00),
                                          width: getHorizontalSize(388.00),
                                          margin: getMargin(top: 16),
                                          decoration: BoxDecoration(
                                              color: ColorConstant.gray300,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getHorizontalSize(
                                                          1.00)))),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              AppRoutes.historyEmptyScreen);
                                        },
                                        child: Padding(
                                            padding: getPadding(top: 16),
                                            child: Container(
                                              color: ColorConstant.whiteA700,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgHistryIcon,
                                                        ),
                                                        Padding(
                                                            padding: getPadding(
                                                                left: 16),
                                                            child: Text(
                                                                "lbl_history"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtSFUITextRegular17
                                                                    .copyWith(
                                                                        height:
                                                                            getVerticalSize(1.08)))),
                                                      ],
                                                    ),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgrightArrow,
                                                        height: getSize(24.00),
                                                        width: getSize(24.00))
                                                  ]),
                                            )),
                                      ),
                                      Container(
                                          height: getVerticalSize(1.00),
                                          width: getHorizontalSize(388.00),
                                          margin: getMargin(top: 16),
                                          decoration: BoxDecoration(
                                              color: ColorConstant.gray300,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getHorizontalSize(
                                                          1.00)))),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(SupportScreen());
                                        },
                                        child: Padding(
                                            padding: getPadding(top: 16),
                                            child: Container(
                                              color: ColorConstant.whiteA700,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgSupportIcon,
                                                        ),
                                                        Padding(
                                                            padding: getPadding(
                                                                left: 16),
                                                            child: Text(
                                                                "lbl_support"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtSFUITextRegular17
                                                                    .copyWith(
                                                                        height:
                                                                            getVerticalSize(1.08)))),
                                                      ],
                                                    ),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgrightArrow,
                                                        height: getSize(24.00),
                                                        width: getSize(24.00))
                                                  ]),
                                            )),
                                      ),
                                      Container(
                                          height: getVerticalSize(1.00),
                                          width: getHorizontalSize(388.00),
                                          margin: getMargin(top: 16),
                                          decoration: BoxDecoration(
                                              color: ColorConstant.gray300,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getHorizontalSize(
                                                          1.00)))),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(SettingOptionScreen());
                                        },
                                        child: Padding(
                                            padding: getPadding(top: 16),
                                            child: Container(
                                              color: ColorConstant.whiteA700,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgSettingIcon,
                                                        ),
                                                        Padding(
                                                            padding: getPadding(
                                                                left: 16),
                                                            child: Text(
                                                                "lbl_settings"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtSFUITextRegular17
                                                                    .copyWith(
                                                                        height:
                                                                            getVerticalSize(1.08)))),
                                                      ],
                                                    ),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgrightArrow,
                                                        height: getSize(24.00),
                                                        width: getSize(24.00))
                                                  ]),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            CustomButton(
                              margin: getMargin(top: 96),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: ProfileDialog(
                                          Get.put(ProfileController())),
                                    );
                                  },
                                );
                              },
                              height: 45,
                              width: 388,
                              text: "Log Out",
                              variant: ButtonVariant.OutlineblueA200,
                              fontStyle: ButtonFontStyle.SFUITex14width400,
                            ),
                          ]),
                    ],
                  )))),
    );
  }

  onTapArrowleft10() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemNavigator.pop();
    });
  }
}
