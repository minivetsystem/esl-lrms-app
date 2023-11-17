import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_page.dart';
import 'forgot_password_otp_verify.dart';
import 'controller/forgot_password_four_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/core/utils/validation_functions.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_image.dart';
import 'package:truck_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:truck_booking_app/widgets/custom_button.dart';
import 'package:truck_booking_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordFourScreen extends GetWidget<ForgotPasswordFourController> {
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
        minimum: EdgeInsets.only(top: 32),
        color: ColorConstant.whiteA700,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                //
                height: getVerticalSize(56.00),
                leadingWidth: 52,
                leading: AppbarImage(
                    height: getSize(32.00),
                    width: getSize(32.00),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 20, top: 12, bottom: 12),
                    onTap: onTapArrowleft4),
                centerTitle: true,
                title: AppbarImage(
                    margin: getMargin(top: 8),
                    height: getVerticalSize(32.00),
                    width: getHorizontalSize(148.00),
                    svgPath: ImageConstant.imgGroup3)),
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding:
                        getPadding(left: 20, top: 15, right: 20, bottom: 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(top: 23),
                              child: Text("lbl_sign_up".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFUITextBold27.copyWith(
                                      height: getVerticalSize(1.02)))),
                          Container(
                              width: getHorizontalSize(388.00),
                              margin: getMargin(top: 16),
                              child: Text("Enter your details to sign up!",
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtSFUITextRegular17
                                      .copyWith(height: getVerticalSize(1.5)))),
                          //
                          CustomTextFormField(
                              shadowTextfield: false,
                              function: () {},
                              width: 388,
                              focusNode: FocusNode(),
                              controller: controller.masterInputController,
                              hintText: "lbl_first_name".tr,
                              margin: getMargin(top: 21),
                              prefix: Container(
                                  margin: getMargin(
                                      left: 16, top: 12, right: 8, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgUser)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(48.00)),
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          CustomTextFormField(
                              shadowTextfield: false,
                              function: () {},
                              width: 388,
                              focusNode: FocusNode(),
                              controller: controller.masterInputOneController,
                              hintText: "lbl_last_name".tr,
                              margin: getMargin(top: 16),
                              prefix: Container(
                                  margin: getMargin(
                                      left: 16, top: 12, right: 8, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgUserGray100)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(48.00)),
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          CustomTextFormField(
                              shadowTextfield: false,
                              function: () {},
                              width: 388,
                              focusNode: FocusNode(),
                              controller: controller.masterInputTwoController,
                              hintText: "lbl_email_address".tr,
                              margin: getMargin(top: 16),
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 16, top: 12, right: 8, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgArrowdown)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(48.00)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              }),
                          CustomTextFormField(
                              shadowTextfield: false,
                              function: () {},
                              width: 388,
                              focusNode: FocusNode(),
                              controller: controller.masterInputThreeController,
                              hintText: "lbl_phone_number".tr,
                              margin: getMargin(top: 16),
                              textInputType: TextInputType.phone,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 16, top: 12, right: 8, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgCall)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(48.00)),
                              validator: (value) {
                                if (!isValidPhone(value)) {
                                  return "Please enter valid phone number";
                                }
                                return null;
                              }),
                          Obx(() => CustomTextFormField(
                              shadowTextfield: false,
                              function: () {},
                              width: 388,
                              focusNode: FocusNode(),
                              controller: controller.masterInputFourController,
                              hintText: "lbl_password".tr,
                              margin: getMargin(top: 16),
                              padding: TextFormFieldPadding.PaddingT14_1,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 16, top: 12, right: 8, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgLock)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(48.00)),
                              suffix: InkWell(
                                  onTap: () {
                                    controller.isShowPassword.value =
                                        !controller.isShowPassword.value;
                                  },
                                  child: Container(
                                      margin: getMargin(
                                          left: 30,
                                          top: 12,
                                          right: 16,
                                          bottom: 12),
                                      child: CustomImageView(
                                          svgPath: controller
                                                  .isShowPassword.value
                                              ? ImageConstant.imgCheckmarkShow
                                              : ImageConstant.imgCheckmark))),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(48.00)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter the  password';
                                }
                                if (value.length < 8) {
                                  return 'Please enter 8 charecter password';
                                }
                                return null;
                                // if (value == null ) {
                                //   return "Please enter valid password";
                                // }
                                // return null;
                              },
                              isObscureText: !controller.isShowPassword.value)),
                          CustomButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  Get.to(SignUpOTPVerificationScreen());
                                }
                              },
                              height: 50.h,
                              width: 388,
                              text: "lbl_continue".tr,
                              margin: getMargin(top: 32)),
                          Spacer(),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_already_have_an2".tr,
                                    style: TextStyle(
                                        color: ColorConstant.gray600,
                                        fontSize: getFontSize(17),
                                        fontFamily: 'SF UI Text',
                                        fontWeight: FontWeight.w400,
                                        height: getVerticalSize(1.08))),
                                TextSpan(
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () => Get.back(),
                                    text: "lbl_sign_in".tr,
                                    style: TextStyle(
                                        color: ColorConstant.blueA200,
                                        fontSize: getFontSize(18),
                                        fontFamily: 'SF UI Text',
                                        fontWeight: FontWeight.w700,
                                        height: getVerticalSize(1.07)))
                              ]),
                              textAlign: TextAlign.left),
                        ])))),
      ),
    );
  }

  onTapArrowleft4() {
    Get.back();
  }
}
