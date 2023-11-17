import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/core/utils/validation_functions.dart';
import 'package:truck_booking_app/widgets/custom_button.dart';
import 'package:truck_booking_app/widgets/custom_text_form_field.dart';
import 'package:truck_booking_app/domain/facebookauth/facebook_auth_helper.dart';
import 'package:truck_booking_app/domain/googleauth/google_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding:
                        getPadding(left: 20, top: 15, right: 20, bottom: 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgGroup3,
                              height: getVerticalSize(32.00),
                              width: getHorizontalSize(134.00),
                              margin: getMargin(top: 17)),
                          Padding(
                              padding: getPadding(top: 50),
                              child: Text("lbl_login".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFUITextBold27.copyWith(
                                      height: getVerticalSize(1.02)))),
                          Container(
                              width: getHorizontalSize(354.00),
                              margin: getMargin(top: 14),
                              child: Text("msg_log_in_with_your2".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtSFUITextRegular17.copyWith(
                                      height: getVerticalSize(1.08)))),
                          Container(
                              width: getHorizontalSize(386.00),
                              margin: getMargin(top: 22, right: 1),
                              decoration: AppDecoration.outlineRed500.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder4),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: getPadding(
                                            left: 16,
                                            top: 12,
                                            right: 16,
                                            bottom: 12),
                                        decoration: AppDecoration.fillGray100
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder4),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgCheckmarkGray600,
                                                  height: getSize(24.00),
                                                  width: getSize(24.00)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 8,
                                                      top: 2,
                                                      right: 223,
                                                      bottom: 3),
                                                  child: Text(
                                                      "lbl_email_address".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSFUITextRegular15
                                                          .copyWith(
                                                              height:
                                                                  getVerticalSize(
                                                                      1.12))))
                                            ])),
                                    CustomTextFormField(
                                        shadowTextfield: false,
                                        width: 374,
                                        focusNode: FocusNode(),
                                        controller:
                                            controller.groupSixtyNineController,
                                        hintText: "msg_please_enter_your".tr,
                                        margin: getMargin(top: 4),
                                        variant: TextFormFieldVariant.None,
                                        fontStyle: TextFormFieldFontStyle
                                            .SFUITextRegular15Red500,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidEmail(value,
                                                  isRequired: true))) {
                                            return "Please enter valid email";
                                          }
                                          return null;
                                        })
                                  ])),
                          Obx(() => CustomTextFormField(
                              shadowTextfield: false,
                              width: 386,
                              focusNode: FocusNode(),
                              controller: controller.groupFourController,
                              hintText: "lbl_password".tr,
                              margin: getMargin(top: 17),
                              padding: TextFormFieldPadding.PaddingT14_1,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 16, top: 12, right: 8, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgLockGray600)),
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
                                          right: 15,
                                          bottom: 12),
                                      child: CustomImageView(
                                          svgPath: controller
                                                  .isShowPassword.value
                                              ? ImageConstant
                                                  .imgCheckmarkGray60024x23
                                              : ImageConstant
                                                  .imgCheckmarkGray60024x23))),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(48.00)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPassword(value,
                                        isRequired: true))) {
                                  return "Please enter valid password";
                                }
                                return null;
                              },
                              isObscureText: !controller.isShowPassword.value)),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: getPadding(top: 4),
                                  child: Text("msg_please_enter_your2".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFUITextRegular15Red500
                                          .copyWith(
                                              height: getVerticalSize(1.12))))),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: getPadding(top: 10),
                                  child: Text("msg_forgot_password".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFUITextRegular17
                                          .copyWith(
                                              height: getVerticalSize(1.08))))),
                          CustomButton(
                              height: 50,
                              width: 388,
                              text: "lbl_login".tr,
                              margin: getMargin(top: 47)),
                          Padding(
                              padding: getPadding(top: 16),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        height: getVerticalSize(1.00),
                                        width: getHorizontalSize(166.00),
                                        margin: getMargin(top: 9, bottom: 7),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.gray300)),
                                    Text("lbl_or".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSFUITextRegular15
                                            .copyWith(
                                                height: getVerticalSize(1.12))),
                                    Container(
                                        height: getVerticalSize(1.00),
                                        width: getHorizontalSize(172.00),
                                        margin: getMargin(top: 9, bottom: 7),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.gray300))
                                  ])),
                          Padding(
                              padding: getPadding(top: 17),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomButton(
                                        height: 56,
                                        width: 186,
                                        text: "lbl_facebook".tr,
                                        variant: ButtonVariant.FillGray100,
                                        padding: ButtonPadding.PaddingT17,
                                        fontStyle:
                                            ButtonFontStyle.SFUITextRegular16,
                                        prefixWidget: Container(
                                            margin: getMargin(right: 16),
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgFacebook)),
                                        onTap: onTapFacebook),
                                    CustomButton(
                                        height: 56,
                                        width: 186,
                                        text: "lbl_google".tr,
                                        variant: ButtonVariant.FillGray100,
                                        padding: ButtonPadding.PaddingT17,
                                        fontStyle:
                                            ButtonFontStyle.SFUITextRegular16,
                                        prefixWidget: Container(
                                            margin: getMargin(right: 16),
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgGoogle)),
                                        onTap: onTapGoogle)
                                  ])),
                          Spacer(),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_don_t_have_an_account2".tr,
                                    style: TextStyle(
                                        color: ColorConstant.gray600,
                                        fontSize: getFontSize(17),
                                        fontFamily: 'SF UI Text',
                                        fontWeight: FontWeight.w400,
                                        height: getVerticalSize(1.08))),
                                TextSpan(
                                    text: "lbl_sign_up".tr,
                                    style: TextStyle(
                                        color: ColorConstant.blueA200,
                                        fontSize: getFontSize(18),
                                        fontFamily: 'SF UI Text',
                                        fontWeight: FontWeight.w700,
                                        height: getVerticalSize(1.07)))
                              ]),
                              textAlign: TextAlign.left),
                          Container(
                              height: getVerticalSize(5.00),
                              width: getHorizontalSize(135.00),
                              margin: getMargin(top: 44),
                              decoration: BoxDecoration(
                                  color: ColorConstant.black900,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(2.00))))
                        ])))));
  }

  onTapFacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapGoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }
}
