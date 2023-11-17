import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_page.dart';
import 'controller/login_screen_three_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/core/utils/validation_functions.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_image.dart';
import 'package:truck_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:truck_booking_app/widgets/custom_button.dart';
import 'package:truck_booking_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginScreenThreeScreen extends GetWidget<LoginScreenThreeController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
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
        minimum: EdgeInsets.only(top: 32.h),
        color: ColorConstant.whiteA700,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.lightGray,
            appBar: CustomAppBar(
                // minimum:EdgeInsets.only(top: 32),
                height: 56.h,
                leadingWidth: 52.h,
                leading: AppbarImage(
                    height: 32.h,
                    width: 32.h,
                    svgPath: ImageConstant.imgArrowleft,
                    margin:
                        EdgeInsets.only(left: 20.h, top: 12.h, bottom: 12.h),
                    onTap: onTapArrowleft),
                centerTitle: true,
                title: AppbarImage(
                    margin: EdgeInsets.only(top: 8.h),
                    height: 32.h,
                    width: 148.h,
                    svgPath: ImageConstant.imgGroup3)),
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding: EdgeInsets.only(
                        left: 20.h, top: 15.h, right: 20.h, bottom: 15.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 23.h),
                              child: Text("msg_forgot_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFUITextBold27
                                      .copyWith(height: 1.5.h))),
                          Container(
                              width: 366.h,
                              margin: EdgeInsets.only(top: 13.h),
                              child: Text("msg_please_enter_the".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtSFUITextRegular17
                                      .copyWith(height: 1.5.h))),
                          CustomTextFormField(
                              shadowTextfield: false,
                              function: () {},
                              width: double.infinity,
                              focusNode: FocusNode(),
                              controller: controller.masterInputController,
                              hintText: "lbl_email_address".tr,
                              margin: EdgeInsets.only(top: 21.h),
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: EdgeInsets.only(
                                      left: 16.h,
                                      top: 12.h,
                                      right: 8.h,
                                      bottom: 12.h),
                                  child: CustomImageView(
                                      svgPath:
                                          ImageConstant.imgCheckmarkGray600)),
                              prefixConstraints:
                                  BoxConstraints(maxHeight: 48.h),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              }),
                          CustomButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  Get.toNamed(
                                      AppRoutes.forgotPasswordThreeScreen);
                                }
                              },
                              height: 50.h,
                              width: 388,
                              text: "lbl_continue".tr,
                              margin: EdgeInsets.only(top: 32.h)),
                        ])))),
      ),
    );
  }

  onTapArrowleft() {
    Get.back();
  }
}
