import 'package:colorful_safe_area/colorful_safe_area.dart';

import '../../widgets/custom_page.dart';
import 'controller/view_information_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_image.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:truck_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:truck_booking_app/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class ViewInformationOneScreen extends GetWidget<ViewInformationOneController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomPage(widget: get_page());
  }

// ignore: non_constant_identifier_names
  Widget get_page() {
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
                    onTap: onTapArrowleft11),
                title: AppbarSubtitle(
                    text: "My Profile", margin: getMargin(left: 16)),
                styleType: Style.bgFillblueA200),
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding: getPadding(top: 10, bottom: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
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
                                          getHorizontalSize(50.00)),
                                      alignment: Alignment.center,
                                      margin: getMargin(top: 0)),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: getPadding(top: 8),
                                          child: Text("lbl_lorem_ipsum".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextBold17Width700black
                                                  .copyWith(
                                                      height: getVerticalSize(
                                                          1.5))))),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: getPadding(top: 4),
                                          child: Text(
                                              "msg_loremipsum_gmail_com2".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular15
                                                  .copyWith(
                                                      height: getVerticalSize(
                                                          1.5))))),
                                ],
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
                                    top: 16, bottom: 16, right: 20, left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 0),
                                        child: Text("lbl_your_name".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSFUITextBold17Width700black
                                                .copyWith(
                                                    height:
                                                        getVerticalSize(1.5)))),
                                    Padding(
                                        padding: getPadding(top: 4),
                                        child: Text("lbl_wade_warren".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSFUITextRegular17
                                                .copyWith(
                                                    height:
                                                        getVerticalSize(1.5)))),
                                    Container(
                                        height: getVerticalSize(1.00),
                                        width: double.infinity,
                                        margin: getMargin(top: 16),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.gray300,
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(1.00)))),
                                    Padding(
                                        padding: getPadding(top: 16),
                                        child: Text("msg_your_email_address".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSFUITextBold17Width700black
                                                .copyWith(
                                                    height:
                                                        getVerticalSize(1.5)))),
                                    Padding(
                                        padding: getPadding(top: 6),
                                        child: Text(
                                            "msg_wadewareen_gmail_com".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSFUITextRegular15Black900
                                                .copyWith(
                                                    height:
                                                        getVerticalSize(1.5)))),
                                    Container(
                                        height: getVerticalSize(1.00),
                                        width: double.infinity,
                                        margin: getMargin(top: 16),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.gray300,
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(1.00)))),
                                    Padding(
                                        padding: getPadding(top: 16),
                                        child: Text("msg_your_mobile_number".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSFUITextBold17Width700black
                                                .copyWith(
                                                    height:
                                                        getVerticalSize(1.5)))),
                                    Padding(
                                        padding: getPadding(top: 5),
                                        child: Text("lbl_91_5898545875".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSFUITextRegular15Black900
                                                .copyWith(
                                                    height:
                                                        getVerticalSize(1.5)))),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          CustomButton(
                              alignment: Alignment.center,
                              onTap: () {
                                Get.toNamed(AppRoutes.viewInformationScreen);
                              },
                              height: 50,
                              width: 388,
                              text: "lbl_edit_profile".tr),
                        ])))));
  }

  onTapArrowleft11() {
    Get.back();
  }
}
