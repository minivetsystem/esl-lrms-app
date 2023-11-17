import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_page.dart';
import 'controller/forgot_password_three_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_image.dart';
import 'package:truck_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:truck_booking_app/widgets/custom_button.dart';

class ForgotPasswordThreeScreen
    extends GetWidget<ForgotPasswordThreeController> {
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
        color: ColorConstant.whiteA700,
        minimum: EdgeInsets.only(top: 32.h),
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: 56.h,
                leadingWidth: 52.h,
                leading: AppbarImage(
                    height: 32.h,
                    width: 32.h,
                    svgPath: ImageConstant.imgArrowleft,
                    margin:
                        EdgeInsets.only(left: 20.h, top: 12.h, bottom: 12.h),
                    onTap: onTapArrowleft1),
                centerTitle: true,
                title: AppbarImage(
                    margin: EdgeInsets.only(top: 8.h),
                    height: 32.h,
                    width: 148.h,
                    svgPath: ImageConstant.imgGroup3)),
            body: Container(
                width: size.width,
                padding: EdgeInsets.only(
                    left: 20.h, top: 15.h, right: 20.h, bottom: 15.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 23.h),
                          child: Text("Enter OTP",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSFUITextBold27
                                  .copyWith(height: 1.5.h))),
                      Container(
                          width: 388.h,
                          margin: EdgeInsets.only(top: 16.h),
                          child: Text("msg_please_enter_the2".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtSFUITextRegular17
                                  .copyWith(height: 1.5.h))),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 22.h, top: 21.h, right: 22.h),
                        child: Container(
                          height: 48.h,
                          child: OtpTextField(
                            onSubmit: (value) {},

                            filled: true,
                            fillColor: ColorConstant.textFilledColor,
                            cursorColor: ColorConstant.blue,
                            borderColor: ColorConstant.textFilledColor,
                            numberOfFields: 5,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            enabledBorderColor: ColorConstant.textFilledColor,
                            showFieldAsBox: true,
                            borderRadius: BorderRadius.circular(12.h),
                            borderWidth: 1,
                            focusedBorderColor: ColorConstant.blue,
                            fieldWidth: getHorizontalSize(48),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                fillColor: ColorConstant.gray100),
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 32.h),
                          child: Text("lbl_resend_code".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSFUITextBold14
                                  .copyWith(height: 1.26.h))),
                      CustomButton(
                          onTap: () {
                            Get.toNamed(AppRoutes.forgotPasswordScreen);
                          },
                          height: 50.h,
                          width: 388.h,
                          text: "lbl_continue".tr,
                          margin: EdgeInsets.only(top: 32.h)),
                    ]))),
      ),
    );
  }

  onTapArrowleft1() {
    Get.back();
  }
}
