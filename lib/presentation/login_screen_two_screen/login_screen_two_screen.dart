import 'controller/login_screen_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/core/utils/validation_functions.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';
import 'package:vedanta_lrms/widgets/custom_text_form_field.dart';
import 'package:vedanta_lrms/domain/facebookauth/facebook_auth_helper.dart';
import 'package:vedanta_lrms/domain/googleauth/google_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LoginScreenTwoScreen extends GetWidget<LoginScreenTwoController> {
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
                      Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset('assets/images/20220310134204.png',
                            height: 90,),
                          ),
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
                          CustomTextFormField(
                              shadowTextfield: false,
                              width: 388,
                              focusNode: FocusNode(),
                              controller: controller.emailController,
                              hintText: "msg_loremipsum_gmail_com".tr,
                              margin: getMargin(top: 21),
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 16, top: 12, right: 8, bottom: 12),
                                  child: CustomImageView(
                                      svgPath:
                                          ImageConstant.imgCheckmarkGray600)),
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
                              width: 388,
                              focusNode: FocusNode(),
                              controller: controller.passwordController,
                              hintText: "lbl".tr,
                              margin: getMargin(top: 16),
                              padding: TextFormFieldPadding.PaddingT14_1,
                              textInputAction: TextInputAction.done,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 16, top: 12, right: 8, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgLock)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(48.00)),
                              suffix: Container(
                                  margin: getMargin(
                                      left: 30, top: 12, right: 16, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgCheckmark)),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(48.00))),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: getPadding(top: 9),
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
                              padding: getPadding(top: 25),
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
