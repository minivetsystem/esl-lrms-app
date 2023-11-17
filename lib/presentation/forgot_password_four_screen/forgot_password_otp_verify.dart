import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_page.dart';
import '../forgot_password_three_screen/controller/forgot_password_three_controller.dart';
import 'account_created_dialogue.dart';

class SignUpOTPVerificationScreen extends StatefulWidget {
  const SignUpOTPVerificationScreen({Key? key}) : super(key: key);

  @override
  State<SignUpOTPVerificationScreen> createState() =>
      _SignUpOTPVerificationScreenState();
}

class _SignUpOTPVerificationScreenState
    extends State<SignUpOTPVerificationScreen> {
  SignUpOTPVerificationScreenController signUpOTPVerificationScreenController =
      Get.put(SignUpOTPVerificationScreenController());
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
        color: ColorConstant.whiteA700,
        minimum: EdgeInsets.only(top: 32),
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                //minimum:EdgeInsets.only(top: 32),
                height: getVerticalSize(56.00),
                leadingWidth: 52,
                leading: AppbarImage(
                    height: getSize(32.00),
                    width: getSize(32.00),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 20, top: 12, bottom: 12),
                    onTap: () {
                      Get.back();
                    }),
                centerTitle: true,
                title: AppbarImage(
                    margin: getMargin(top: 8),
                    height: getVerticalSize(32.00),
                    width: getHorizontalSize(148.00),
                    svgPath: ImageConstant.imgGroup3)),
            body: Container(
                width: size.width,
                padding: getPadding(left: 20, top: 15, right: 20, bottom: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(top: 23),
                          child: Text("Verify",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSFUITextBold27
                                  .copyWith(height: getVerticalSize(1.5)))),
                      Container(
                          width: getHorizontalSize(388.00),
                          margin: getMargin(top: 16),
                          child: Text("msg_please_enter_the2".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtSFUITextRegular17
                                  .copyWith(height: getVerticalSize(1.5)))),
                      Padding(
                        padding: getPadding(left: 22, top: 21, right: 22),
                        child: Container(
                          height: getVerticalSize(48),
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
                            borderRadius: BorderRadius.circular(12),
                            borderWidth: 1,
                            focusedBorderColor: ColorConstant.blue,
                            fieldWidth: kIsWeb ? 40 : getHorizontalSize(48),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                fillColor: ColorConstant.gray100),
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                      ),
                      Padding(
                          padding: getPadding(top: 32),
                          child: Text("lbl_resend_code".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSFUITextBold14
                                  .copyWith(height: getVerticalSize(1.26)))),
                      CustomButton(
                          onTap: () {
                            // Get.toNamed(AppRoutes.forgotPasswordScreen);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22)),
                                  insetPadding:
                                      EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                      width: kIsWeb ? 428 : double.infinity,
                                      child: AccountCreatedDialogue()),
                                );
                              },
                            );
                            // Get.defaultDialog(
                            //   contentPadding: EdgeInsets.zero,
                            //   title: '',
                            //   backgroundColor: Colors.transparent,
                            //   content: Container(
                            //     child:
                            //   ),
                            // );
                          },
                          height: 50,
                          width: 388,
                          text: "lbl_continue".tr,
                          margin: getMargin(top: 32)),
                    ]))),
      ),
    );
  }
}
