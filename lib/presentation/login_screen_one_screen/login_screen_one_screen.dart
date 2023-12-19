import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/core/utils/validation_functions.dart';
import 'package:vedanta_lrms/data/apiClient/api_client.dart';
import 'package:vedanta_lrms/data/models/loginModel/login_model.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';
import 'package:vedanta_lrms/widgets/custom_text_form_field.dart';
import 'package:vedanta_lrms/domain/facebookauth/facebook_auth_helper.dart';
import 'package:vedanta_lrms/domain/googleauth/google_auth_helper.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class LoginScreenOneScreen extends StatefulWidget {
  const LoginScreenOneScreen({super.key});

  @override
  State<LoginScreenOneScreen> createState() => _LoginScreenOneScreenState();
}

class _LoginScreenOneScreenState extends State<LoginScreenOneScreen> {
  TextEditingController masterInputController = TextEditingController();

  TextEditingController masterInputOneController = TextEditingController();
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  bool isShowPassword = false;
  AndroidDeviceInfo? deviceInfo;

  var token = '';
  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }

  Future<void> loginAuth() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('key', 'value');
    var url = Uri.parse('${Constant.baseurl}login');
    // var request = http.MultipartRequest('POST', url);
    var map = new Map<String, dynamic>();
    // Add form fields (non-file data)
    map['email'] = masterInputController.text;
    map['password'] = masterInputOneController.text;
    map['device_id'] = deviceInfo!.brand;
    // final response = await http.MultipartRequest('POST',Uri.parse('${Constant.baseurl}login'));
    final response = await http.post(
      url,
      body: map,
    );
    // var response = await request.send();
    // final respStr = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      // Map<String, dynamic> jsonMap = json.decode(response.body);
      var data = jsonDecode(response.body.toString());
      setState(() {
        token = data['token'];
      });
      print(token);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);

      if (token != '') {
        PrefUtils.setIsSignIn(false);
        Get.toNamed(AppRoutes.homeFourContainerScreen);
      }
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  //  _Login() async {
  //   final res = await ApiClient().loginAuth(masterInputController.text, masterInputOneController.text, deviceInfo!.product);
  //         setState(() {
  //         token = res['token'];
  //       });
  //       print(token);
  // }
  Future<void> _getDeviceInfo() async {
    try {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      setState(() {
        deviceInfo = androidInfo;
      });
      print(deviceInfo!.product.toString());
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      // setState(() {
      //   deviceInfo = 'iOS\n'
      //       'Device: ${iosInfo.utsname.machine}\n'
      //       'Model: ${iosInfo.model}\n'
      //       'OS Version: ${iosInfo.systemVersion}';
      // });
      // print(iosInfo.utsname.machine);
    } catch (e) {
      print(e);
    }
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

  @override
  Widget build(BuildContext context) {
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
            body: Container(
                width: size.width,
                padding: EdgeInsets.only(
                    left: 20.h, top: 15.h, right: 20.h, bottom: 15.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        child: Image.asset(
                          'assets/images/20220310134204.png',
                          height: 90,
                        ),
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
                          controller: masterInputController,
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
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48.00)),
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
                          width: double.infinity,
                          focusNode: FocusNode(),
                          controller: masterInputOneController,
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
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48.00)),
                          suffix: InkWell(
                              onTap: () {
                                isShowPassword = !isShowPassword;
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: 30.h,
                                      top: 12.h,
                                      right: 16.h,
                                      bottom: 12.h),
                                  child: CustomImageView(
                                      svgPath: isShowPassword
                                          ? ImageConstant.imgCheckmarkShow
                                          : ImageConstant.imgCheckmark))),
                          suffixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48.00)),
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
                          isObscureText: !isShowPassword),
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
                                            height: getVerticalSize(1.08))))),
                      ),
                      CustomButton(
                          onTap: loginAuth
                          // PrefUtils.setIsSignIn(false);
                          // Get.toNamed(
                          //     AppRoutes.homeFourContainerScreen);
                          ,
                          height: 50.h,
                          width: width,
                          text: "lbl_login".tr,
                          margin: EdgeInsets.only(top: 47.h)),
                      // Padding(
                      //     padding: EdgeInsets.only(top: 16.h),
                      //     child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         crossAxisAlignment: CrossAxisAlignment.end,
                      //         children: [
                      //           Expanded(
                      //             child: Container(
                      //                 height: getVerticalSize(1.00),
                      //                 margin: EdgeInsets.only(
                      //                     top: 9.h, bottom: 7.h),
                      //                 decoration: BoxDecoration(
                      //                     color: ColorConstant.gray300)),
                      //           ),
                      //           Text("lbl_or".tr,
                      //               overflow: TextOverflow.ellipsis,
                      //               textAlign: TextAlign.left,
                      //               style: AppStyle.txtSFUITextRegular15
                      //                   .copyWith(
                      //                       height: getVerticalSize(1.12))),
                      //           Expanded(
                      //             child: Container(
                      //                 height: 1.h,
                      //                 margin: EdgeInsets.only(
                      //                     top: 9.h, bottom: 7.h),
                      //                 decoration: BoxDecoration(
                      //                     color: ColorConstant.gray300)),
                      //           )
                      //         ])),
                      // Padding(
                      //     padding: EdgeInsets.only(top: 17.h),
                      //     child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           // Expanded(
                      //           //   child: CustomButton(
                      //           //       height: 56.h,
                      //           //       text: "lbl_facebook".tr,
                      //           //       variant: ButtonVariant.FillGray100,
                      //           //       padding: ButtonPadding.PaddingT17,
                      //           //       fontStyle:
                      //           //           ButtonFontStyle.SFUITextRegular16,
                      //           //       prefixWidget: Container(
                      //           //           child: CustomImageView(
                      //           //               svgPath:
                      //           //                   ImageConstant.imgFacebook)),
                      //           //       onTap: onTapFacebook),
                      //           // ),
                      //           // SizedBox(
                      //           //   width: 16.h,
                      //           // ),
                      //           // Expanded(
                      //           //   child: CustomButton(
                      //           //       height: 56.h,
                      //           //       text: "lbl_google".tr,
                      //           //       variant: ButtonVariant.FillGray100,
                      //           //       padding: ButtonPadding.PaddingT17,
                      //           //       fontStyle:
                      //           //           ButtonFontStyle.SFUITextRegular16,
                      //           //       prefixWidget: Container(
                      //           //           child: CustomImageView(
                      //           //               svgPath:
                      //           //                   ImageConstant.imgGoogle)),
                      //           //       onTap: onTapGoogle),
                      //           // )
                      //         ])),
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
                    ]))),
      ),
    );
  }
}
