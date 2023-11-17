import 'package:colorful_safe_area/colorful_safe_area.dart';

import '../../widgets/custom_page.dart';
import 'controller/view_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/core/utils/validation_functions.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_image.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:truck_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:truck_booking_app/widgets/custom_button.dart';
import 'package:truck_booking_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ViewInformationScreen extends GetWidget<ViewInformationController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      onTap: onTapArrowleft12),
                  title: AppbarSubtitle(
                      text: "lbl_edit_profile".tr, margin: getMargin(left: 16)),
                  styleType: Style.bgFillblueA200),
              body: Form(
                  key: _formKey,
                  child: Container(
                      width: size.width,
                      padding: getPadding(top: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              color: ColorConstant.whiteA700,
                              child: Padding(
                                padding:
                                    getPadding(left: 20, right: 20, bottom: 16),
                                child: Column(
                                  children: [
                                    CustomTextFormField(
                                        shadowTextfield: false,
                                        function: () {},
                                        width: double.infinity,
                                        focusNode: FocusNode(),
                                        controller:
                                            controller.masterInputController,
                                        hintText: "UserName".tr,
                                        margin: getMargin(top: 17),
                                        prefix: Container(
                                            margin: getMargin(
                                                left: 16,
                                                top: 12,
                                                right: 8,
                                                bottom: 12),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgUserGray100)),
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(48.00))),
                                    CustomTextFormField(
                                        shadowTextfield: false,
                                        function: () {},
                                        width: double.infinity,
                                        focusNode: FocusNode(),
                                        controller: controller.emailController,
                                        hintText: "Email address".tr,
                                        margin: getMargin(top: 16),
                                        textInputType:
                                            TextInputType.emailAddress,
                                        prefix: Container(
                                            margin: getMargin(
                                                left: 16,
                                                top: 12,
                                                right: 8,
                                                bottom: 12),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdown)),
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(48.00)),
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidEmail(value,
                                                  isRequired: true))) {
                                            return "Please enter valid email";
                                          }
                                          return null;
                                        }),
                                    CustomTextFormField(
                                        shadowTextfield: false,
                                        function: () {},
                                        width: double.infinity,
                                        focusNode: FocusNode(),
                                        controller:
                                            controller.mobileNoController,
                                        hintText: "Mobile Number",
                                        margin: getMargin(top: 16),
                                        prefix: Container(
                                            margin: getMargin(
                                                left: 16,
                                                top: 12,
                                                right: 8,
                                                bottom: 12),
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgCall)),
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(48.00))),
                                    CustomButton(
                                        onTap: () {
                                          Get.back();
                                        },
                                        height: 50,
                                        width: 388,
                                        text: "lbl_save".tr,
                                        margin: getMargin(top: 32)),
                                  ],
                                ),
                              ),
                            ),
                          ]))))),
    );
  }

  onTapArrowleft12() {
    Get.back();
  }
}
