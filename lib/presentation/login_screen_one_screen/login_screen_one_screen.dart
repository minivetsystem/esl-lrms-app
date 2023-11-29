import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_page.dart';
import 'controller/login_screen_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/core/utils/validation_functions.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';
import 'package:vedanta_lrms/widgets/custom_text_form_field.dart';
import 'package:vedanta_lrms/domain/facebookauth/facebook_auth_helper.dart';
import 'package:vedanta_lrms/domain/googleauth/google_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LoginScreenOneScreen extends GetWidget<LoginScreenOneController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return CustomPage(widget: get_page());

    //   kIsWeb?Center(
    //   child: Container(
    //     width: 428,
    //     child: get_page(),
    //   ),
    // ):get_page();
  }

  // ignore: non_constant_identifier_names
  Widget get_page() {
    return WillPopScope(
      onWillPop: () async {
        Future.delayed(const Duration(milliseconds: 1000), () {
          SystemNavigator.pop();
        });
        return false;
      },
      child: ColorfulSafeArea(
        color: ColorConstant.whiteA700,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding: EdgeInsets.only(
                        left: 20.h, top: 15.h, right: 20.h, bottom: 15.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20.h),
                            child: Image.asset('assets/images/20220310134204.png',
                            height: 90,),
                          ),
                          // CustomImageView(
                          //     svgPath: ImageConstant.loginImage,
                          //     height: 70.h,
                          //     width: 148.h,
                          //     margin: EdgeInsets.only(top: 17.h)),
                          Padding(
                              padding: EdgeInsets.only(top: 50.h),
                              child: Text("lbl_login".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtSFUITextBold27
                                      .copyWith(height: getVerticalSize(1.2)))),
                          Container(
                              width: 359.h,
                              margin: EdgeInsets.only(top: 16.h),
                              child: Text("Enter your details to login!",
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtSFUITextRegular17
                                      .copyWith(height: getVerticalSize(1.5)))),
                          CustomTextFormField(
                              shadowTextfield: false,
                              function: () {},
                              width: double.infinity,
                              focusNode: FocusNode(),
                              controller: controller.masterInputController,
                              hintText: "lbl_email_address".tr,
                              margin: EdgeInsets.only(top: 21.h),
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: EdgeInsets.only(
                                      left: 16.h,
                                      top: 12.h,
                                      right: 8.h,
                                      bottom: 12.h),
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
                          Obx(() => CustomTextFormField(
                              shadowTextfield: false,
                              function: () {},
                              width: double.infinity,
                              focusNode: FocusNode(),
                              controller: controller.masterInputOneController,
                              hintText: "lbl_password".tr,
                              margin: EdgeInsets.only(top: 16.h),
                              padding: TextFormFieldPadding.PaddingT14_1,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              prefix: Container(
                                  margin: EdgeInsets.only(
                                      left: 16.h,
                                      top: 12.h,
                                      right: 8.h,
                                      bottom: 12.h),
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
                                      margin: EdgeInsets.only(
                                          left: 30.h,
                                          top: 12.h,
                                          right: 16.h,
                                          bottom: 12.h),
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

                                // if (value == null ||
                                //     (!isValidPassword(value,
                                //         isRequired: true))) {
                                //   return "Please enter valid password";
                                // }
                                // return null;
                                // if (value == null ) {
                                //   return "Please enter valid password";
                                // }
                                // return null;
                              },
                              isObscureText: !controller.isShowPassword.value)),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.loginScreenThreeScreen);
                            },
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: EdgeInsets.only(top: 9.h),
                                    child: Text("msg_forgot_password".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSFUITextRegular17
                                            .copyWith(
                                                height:
                                                    getVerticalSize(1.08))))),
                          ),
                          CustomButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  PrefUtils.setIsSignIn(false);
                                  Get.toNamed(
                                      AppRoutes.homeFourContainerScreen);
                                }
                              },
                              height: 50.h,
                              width: width,
                              text: "lbl_login".tr,
                              margin: EdgeInsets.only(top: 47.h)),
                          Padding(
                              padding: EdgeInsets.only(top: 16.h),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          height: getVerticalSize(1.00),
                                          margin: EdgeInsets.only(
                                              top: 9.h, bottom: 7.h),
                                          decoration: BoxDecoration(
                                              color: ColorConstant.gray300)),
                                    ),
                                    Text("lbl_or".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSFUITextRegular15
                                            .copyWith(
                                                height: getVerticalSize(1.12))),
                                    Expanded(
                                      child: Container(
                                          height: 1.h,
                                          margin: EdgeInsets.only(
                                              top: 9.h, bottom: 7.h),
                                          decoration: BoxDecoration(
                                              color: ColorConstant.gray300)),
                                    )
                                  ])),
                          Padding(
                              padding: EdgeInsets.only(top: 17.h),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: CustomButton(
                                          height: 56.h,
                                          text: "lbl_facebook".tr,
                                          variant: ButtonVariant.FillGray100,
                                          padding: ButtonPadding.PaddingT17,
                                          fontStyle:
                                              ButtonFontStyle.SFUITextRegular16,
                                          prefixWidget: Container(
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgFacebook)),
                                          onTap: onTapFacebook),
                                    ),
                                    SizedBox(
                                      width: 16.h,
                                    ),
                                    Expanded(
                                      child: CustomButton(
                                          height: 56.h,
                                          text: "lbl_google".tr,
                                          variant: ButtonVariant.FillGray100,
                                          padding: ButtonPadding.PaddingT17,
                                          fontStyle:
                                              ButtonFontStyle.SFUITextRegular16,
                                          prefixWidget: Container(
                                              child: CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgGoogle)),
                                          onTap: onTapGoogle),
                                    )
                                  ])),
                          Spacer(),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_don_t_have_an_account2".tr,
                                    style: TextStyle(
                                        color: ColorConstant.gray600,
                                        fontSize: 17.sp,
                                        fontFamily: 'SF UI Text',
                                        fontWeight: FontWeight.w400,
                                        height: 1.08.h)),
                                TextSpan(
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () => Get.toNamed(
                                          AppRoutes.forgotPasswordFourScreen),
                                    text: "lbl_sign_up".tr,
                                    style: TextStyle(
                                        color: ColorConstant.blueA200,
                                        fontSize: getFontSize(18),
                                        fontFamily: 'SF UI Text',
                                        fontWeight: FontWeight.w700,
                                        height: 1.07.h))
                              ]),
                              textAlign: TextAlign.left),
                        ])))),
      ),
    );

    //   WillPopScope(
    //   onWillPop: () async{
    //     Future.delayed(const Duration(milliseconds: 1000), () {
    //       SystemNavigator.pop();
    //     });
    //     return false;
    //   },
    //   child: ColorfulSafeArea(
    //     color: ColorConstant.whiteA700,
    //     child: Scaffold(
    //         resizeToAvoidBottomInset: false,
    //         backgroundColor: ColorConstant.whiteA700,
    //         body: Form(
    //             key: _formKey,
    //             child: Container(
    //                 width: size.width,
    //                 padding:
    //                 getPadding(left: 20, top: 15, right: 20, bottom: 15),
    //                 child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: [
    //                       CustomImageView(
    //                           svgPath: ImageConstant.imgGroup3,
    //                           height: getVerticalSize(32.00),
    //                           width: getHorizontalSize(148.00),
    //                           margin: getMargin(top: 17)),
    //                       Padding(
    //                           padding: getPadding(top: 50),
    //                           child: Text("lbl_login".tr,
    //                               overflow: TextOverflow.ellipsis,
    //                               textAlign: TextAlign.center,
    //                               style: AppStyle.txtSFUITextBold27.copyWith(
    //                                   height: getVerticalSize(1.2)))),
    //                       Container(
    //                           width: getHorizontalSize(359.00),
    //                           margin: getMargin(top: 16),
    //                           child: Text("Enter your details to login!",
    //                               maxLines: null,
    //                               textAlign: TextAlign.center,
    //                               style: AppStyle.txtSFUITextRegular17.copyWith(
    //                                   height: getVerticalSize(1.5)))),
    //                       CustomTextFormField(
    //                           shadowTextfield: false,
    //                           function: (){},
    //                           width: double.infinity,
    //                           focusNode: FocusNode(),
    //                           controller: controller.masterInputController,
    //                           hintText: "lbl_email_address".tr,
    //                           margin: getMargin(top: 21),
    //                           textInputType: TextInputType.emailAddress,
    //                           prefix: Container(
    //                               margin: getMargin(
    //                                   left: 16, top: 12, right: 8, bottom: 12),
    //                               child: CustomImageView(
    //                                   svgPath: ImageConstant.imgArrowdown)),
    //                           prefixConstraints: BoxConstraints(
    //                               maxHeight: getVerticalSize(48.00)),
    //                           validator: (value) {
    //                             if (value == null ||
    //                                 (!isValidEmail(value, isRequired: true))) {
    //                               return "Please enter valid email";
    //                             }
    //                             return null;
    //                           }),
    //                       Obx(() => CustomTextFormField(
    //                           shadowTextfield: false,
    //                           function: (){},
    //                           width: double.infinity,
    //                           focusNode: FocusNode(),
    //                           controller: controller.masterInputOneController,
    //                           hintText: "lbl_password".tr,
    //                           margin: getMargin(top: 16),
    //                           padding: TextFormFieldPadding.PaddingT14_1,
    //                           textInputAction: TextInputAction.done,
    //                           textInputType: TextInputType.visiblePassword,
    //                           prefix: Container(
    //                               margin: getMargin(
    //                                   left: 16, top: 12, right: 8, bottom: 12),
    //                               child: CustomImageView(
    //                                   svgPath: ImageConstant.imgLock)),
    //                           prefixConstraints: BoxConstraints(
    //                               maxHeight: getVerticalSize(48.00)),
    //                           suffix: InkWell(
    //                               onTap: () {
    //                                 controller.isShowPassword.value =
    //                                 !controller.isShowPassword.value;
    //                               },
    //                               child: Container(
    //                                   margin: getMargin(
    //                                       left: 30,
    //                                       top: 12,
    //                                       right: 16,
    //                                       bottom: 12),
    //                                   child: CustomImageView(
    //                                       svgPath: controller
    //                                           .isShowPassword.value
    //                                           ? ImageConstant.imgCheckmarkShow
    //                                           : ImageConstant.imgCheckmark))),
    //                           suffixConstraints: BoxConstraints(
    //                               maxHeight: getVerticalSize(48.00)),
    //                           validator: (value) {
    //
    //                             if (value!.isEmpty) {
    //                               return 'Enter the  password';
    //                             }
    //                             if (value.length < 8) {
    //                               return 'Please enter 8 charecter password';
    //                             }
    //                             return null;
    //
    //                             // if (value == null ||
    //                             //     (!isValidPassword(value,
    //                             //         isRequired: true))) {
    //                             //   return "Please enter valid password";
    //                             // }
    //                             // return null;
    //                             // if (value == null ) {
    //                             //   return "Please enter valid password";
    //                             // }
    //                             // return null;
    //                           },
    //                           isObscureText: !controller.isShowPassword.value)),
    //                       GestureDetector(
    //                         onTap: (){
    //                           Get.toNamed(AppRoutes.loginScreenThreeScreen);
    //                         },
    //                         child: Align(
    //                             alignment: Alignment.centerRight,
    //                             child: Padding(
    //                                 padding: getPadding(top: 9),
    //                                 child: Text("msg_forgot_password".tr,
    //                                     overflow: TextOverflow.ellipsis,
    //                                     textAlign: TextAlign.left,
    //                                     style: AppStyle.txtSFUITextRegular17
    //                                         .copyWith(
    //                                         height: getVerticalSize(1.08))))),
    //                       ),
    //                       CustomButton(
    //                           onTap: (){
    //                             if(_formKey.currentState!.validate()){
    //                               PrefUtils.setIsSignIn(false);
    //                               Get.toNamed(AppRoutes.homeFourContainerScreen);
    //                             }
    //                           },
    //                           height: 50,
    //                           width: 388,
    //                           text: "lbl_login".tr,
    //                           margin: getMargin(top: 47)),
    //                       Padding(
    //                           padding: getPadding(top: 16),
    //                           child: Row(
    //                               mainAxisAlignment:
    //                               MainAxisAlignment.spaceBetween,
    //                               crossAxisAlignment: CrossAxisAlignment.end,
    //                               children: [
    //                                 Expanded(
    //                                   child: Container(
    //                                       height: getVerticalSize(1.00),
    //                                       margin: getMargin(top: 9, bottom: 7),
    //                                       decoration: BoxDecoration(
    //                                           color: ColorConstant.gray300)),
    //                                 ),
    //                                 Text("lbl_or".tr,
    //                                     overflow: TextOverflow.ellipsis,
    //                                     textAlign: TextAlign.left,
    //                                     style: AppStyle.txtSFUITextRegular15
    //                                         .copyWith(
    //                                         height: getVerticalSize(1.12))),
    //                                 Expanded(
    //                                   child: Container(
    //                                       height: getVerticalSize(1.00),
    //                                       margin: getMargin(top: 9, bottom: 7),
    //                                       decoration: BoxDecoration(
    //                                           color: ColorConstant.gray300)),
    //                                 )
    //                               ])),
    //                       Padding(
    //                           padding: getPadding(top: 17),
    //                           child: Row(
    //                               mainAxisAlignment:
    //                               MainAxisAlignment.spaceBetween,
    //                               children: [
    //                                 Expanded(
    //                                   child: CustomButton(
    //                                       height: 56,
    //                                       text: "lbl_facebook".tr,
    //
    //                                       variant: ButtonVariant.FillGray100,
    //                                       padding: ButtonPadding.PaddingT17,
    //                                       fontStyle:
    //                                       ButtonFontStyle.SFUITextRegular16,
    //                                       prefixWidget: Container(
    //
    //                                           child: CustomImageView(
    //                                               svgPath:
    //                                               ImageConstant.imgFacebook)),
    //                                       onTap: onTapFacebook),
    //                                 ),
    //                                 SizedBox(width: getHorizontalSize(16),),
    //                                 Expanded(
    //                                   child: CustomButton(
    //                                       height: 56,
    //
    //                                       text: "lbl_google".tr,
    //                                       variant: ButtonVariant.FillGray100,
    //                                       padding: ButtonPadding.PaddingT17,
    //                                       fontStyle:
    //                                       ButtonFontStyle.SFUITextRegular16,
    //                                       prefixWidget: Container(
    //
    //                                           child: CustomImageView(
    //                                               svgPath:
    //                                               ImageConstant.imgGoogle)),
    //                                       onTap: onTapGoogle),
    //                                 )
    //                               ])),
    //                       Spacer(),
    //                       RichText(
    //
    //                           text: TextSpan(children: [
    //                             TextSpan(
    //                                 text: "msg_don_t_have_an_account2".tr,
    //                                 style: TextStyle(
    //                                     color: ColorConstant.gray600,
    //                                     fontSize: getFontSize(17),
    //                                     fontFamily: 'SF UI Text',
    //                                     fontWeight: FontWeight.w400,
    //                                     height: getVerticalSize(1.08))),
    //                             TextSpan(
    //                                 recognizer: new TapGestureRecognizer()..onTap = () =>
    //                                     Get.toNamed(AppRoutes.forgotPasswordFourScreen),
    //                                 text: "lbl_sign_up".tr,
    //                                 style: TextStyle(
    //                                     color: ColorConstant.blueA200,
    //                                     fontSize: getFontSize(18),
    //                                     fontFamily: 'SF UI Text',
    //                                     fontWeight: FontWeight.w700,
    //                                     height: getVerticalSize(1.07)))
    //                           ]),
    //                           textAlign: TextAlign.left),
    //
    //                     ])))),
    //   ),
    // );
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
