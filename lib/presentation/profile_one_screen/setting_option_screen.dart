import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vedanta_lrms/presentation/profile_one_screen/privacy_policy_screen.dart';
import 'package:vedanta_lrms/presentation/profile_one_screen/security_screen.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_page.dart';
import 'help_screen.dart';

class SettingOptionScreen extends StatefulWidget {
  const SettingOptionScreen({Key? key}) : super(key: key);

  @override
  State<SettingOptionScreen> createState() => _SettingOptionScreenState();
}

class _SettingOptionScreenState extends State<SettingOptionScreen> {
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
                      text: "lbl_settings".tr, margin: getMargin(left: 16)),
                  styleType: Style.bgFillblueA200),
              body: Container(
                  width: size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(top: 10),
                          child: Container(
                            color: ColorConstant.whiteA700,
                            width: double.infinity,
                            child: Padding(
                              padding: getPadding(
                                  left: 20, right: 20, top: 16, bottom: 16),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(PrivacyPolicyScreen());
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
                                                Padding(
                                                    padding: getPadding(top: 2),
                                                    child: Text(
                                                        "Privacy Policy",
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
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(1.00)))),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(SecurityScreen());
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
                                                Padding(
                                                    padding: getPadding(top: 2),
                                                    child: Text(
                                                        "Terms and Conditions",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSFUITextRegular17
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.08)))),
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
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(1.00)))),
                                  Padding(
                                      padding: getPadding(top: 16),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: getPadding(top: 2),
                                                child: Text("Notifications",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtSFUITextRegular17
                                                        .copyWith(
                                                            height:
                                                                getVerticalSize(
                                                                    1.08)))),
                                            CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgrightArrow,
                                                height: getSize(24.00),
                                                width: getSize(24.00))
                                          ])),
                                  Container(
                                      height: getVerticalSize(1.00),
                                      width: getHorizontalSize(388.00),
                                      margin: getMargin(top: 16),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.gray300,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(1.00)))),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(HelpScreen());
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
                                                Padding(
                                                    padding: getPadding(top: 2),
                                                    child: Text("Help",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSFUITextRegular17
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.08)))),
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
                        )
                      ])))),
    );
  }
}
