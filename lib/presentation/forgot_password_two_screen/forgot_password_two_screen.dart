import 'controller/forgot_password_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';

class ForgotPasswordTwoScreen extends GetWidget<ForgotPasswordTwoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
            height: getVerticalSize(56.00),
            leadingWidth: 52,
            leading: AppbarImage(
                height: getSize(32.00),
                width: getSize(32.00),
                svgPath: ImageConstant.imgArrowleft,
                margin: getMargin(left: 20, top: 12, bottom: 12),
                onTap: onTapArrowleft2),
            centerTitle: true,
            title: AppbarImage(
                height: getVerticalSize(32.00),
                width: getHorizontalSize(134.00),
                svgPath: ImageConstant.imgGroup3)),
        body: SafeArea(
          child: Container(
              width: size.width,
              padding: getPadding(left: 20, top: 15, right: 20, bottom: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: getPadding(top: 22),
                        child: Text("lbl_verify".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFUITextBold27
                                .copyWith(height: getVerticalSize(1.02)))),
                    Container(
                        width: getHorizontalSize(382.00),
                        margin: getMargin(top: 14),
                        child: Text("msg_please_enter_the3".tr,
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: AppStyle.txtSFUITextRegular17
                                .copyWith(height: getVerticalSize(1.08)))),
                    Padding(
                        padding: getPadding(top: 21),
                        child: Obx(() => PinCodeTextField(
                            appContext: context,
                            controller: controller.otpController.value,
                            length: 5,
                            obscureText: false,
                            obscuringCharacter: '*',
                            keyboardType: TextInputType.number,
                            autoDismissKeyboard: true,
                            enableActiveFill: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {},
                            textStyle: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(17),
                                fontFamily: 'SF UI Text',
                                fontWeight: FontWeight.w400,
                                height: getVerticalSize(1.08)),
                            pinTheme: PinTheme(
                                fieldHeight: getHorizontalSize(48.00),
                                fieldWidth: getHorizontalSize(48.00),
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(
                                    getHorizontalSize(4.00)),
                                selectedFillColor: ColorConstant.gray100,
                                activeFillColor: ColorConstant.gray100,
                                inactiveFillColor: ColorConstant.gray100,
                                inactiveColor:
                                    ColorConstant.fromHex("#1212121D"),
                                selectedColor:
                                    ColorConstant.fromHex("#1212121D"),
                                activeColor:
                                    ColorConstant.fromHex("#1212121D"))))),
                    Padding(
                        padding: getPadding(top: 33),
                        child: Text("lbl_resend_code".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFUITextBold14
                                .copyWith(height: getVerticalSize(1.26)))),
                    CustomButton(
                        height: 50,
                        width: 388,
                        text: "lbl_continue".tr,
                        margin: getMargin(top: 34)),
                    Spacer(),
                    Container(
                        height: getVerticalSize(5.00),
                        width: getHorizontalSize(135.00),
                        decoration: BoxDecoration(
                            color: ColorConstant.black900,
                            borderRadius: BorderRadius.circular(
                                getHorizontalSize(2.00))))
                  ])),
        ));
  }

  onTapArrowleft2() {
    Get.back();
  }
}
