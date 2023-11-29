import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vedanta_lrms/presentation/forgot_password_one_dialog/forgot_password_one_dialog.dart';

import '../../widgets/custom_page.dart';
import '../forgot_password_one_dialog/controller/forgot_password_one_controller.dart';
import 'controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';
import 'package:vedanta_lrms/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return CustomPage(widget: get_page(context));
  }

// ignore: non_constant_identifier_names
  Widget get_page(context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: ColorfulSafeArea(
        color: ColorConstant.whiteA700,
        minimum: EdgeInsets.only(top: 32.h),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                //
                height: 56.h,
                leadingWidth: 52.h,
                leading: AppbarImage(
                    height: 32.h,
                    width: 32.h,
                    svgPath: ImageConstant.imgArrowleft,
                    margin:
                        EdgeInsets.only(left: 20.h, top: 12.h, bottom: 12.h),
                    onTap: onTapArrowleft3),
                centerTitle: true,
                title: AppbarImage(
                    margin: EdgeInsets.only(top: 8.h),
                    height: 32.h,
                    width: 148.h,
                    svgPath: ImageConstant.imgGroup3)),
            body: SafeArea(
              child: Form(
                  key: _formKey,
                  child: Container(
                      width: size.width,
                      padding: EdgeInsets.only(
                          left: 20.h, top: 15.h, right: 20.h, bottom: 15.h),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: getPadding(top: 20),
                                child: Text("lbl_reset_password".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextBold27.copyWith(
                                        height: getVerticalSize(1.5)))),
                            Obx(() => CustomTextFormField(
                                shadowTextfield: false,
                                function: () {},
                                width: 388,
                                focusNode: FocusNode(),
                                controller: controller.masterInputController,
                                hintText: "lbl_new_password".tr,
                                margin: getMargin(top: 24),
                                padding: TextFormFieldPadding.PaddingT14_1,
                                textInputType: TextInputType.visiblePassword,
                                prefix: Container(
                                    margin: getMargin(
                                        left: 16,
                                        top: 12,
                                        right: 8,
                                        bottom: 12),
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
                                },
                                isObscureText:
                                    !controller.isShowPassword.value)),
                            Obx(() => CustomTextFormField(
                                shadowTextfield: false,
                                function: () {},
                                width: 388,
                                focusNode: FocusNode(),
                                controller: controller.masterInputOneController,
                                hintText: "msg_confirm_password".tr,
                                margin: getMargin(top: 16),
                                padding: TextFormFieldPadding.PaddingT14_1,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                prefix: Container(
                                    margin: getMargin(
                                        left: 16,
                                        top: 12,
                                        right: 8,
                                        bottom: 12),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgLock)),
                                prefixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(48.00)),
                                suffix: InkWell(
                                    onTap: () {
                                      controller.isShowPassword1.value =
                                          !controller.isShowPassword1.value;
                                    },
                                    child: Container(
                                        margin: getMargin(
                                            left: 30,
                                            top: 12,
                                            right: 16,
                                            bottom: 12),
                                        child: CustomImageView(
                                            svgPath: controller
                                                    .isShowPassword1.value
                                                ? ImageConstant.imgCheckmarkShow
                                                : ImageConstant.imgCheckmark))),
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(48.00)),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter the  password';
                                  }
                                  if (controller
                                          .masterInputOneController.text !=
                                      controller.masterInputController.text) {
                                    print("Not Match");
                                    return 'Password is not match';
                                  }
                                  return null;
                                },
                                isObscureText:
                                    !controller.isShowPassword1.value)),
                            CustomButton(
                                onTap: () {
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (context) => Dialog(
                                  //
                                  //     child: ForgotPasswordOneDialog(
                                  //
                                  //         Get.put(ForgotPasswordOneController())),
                                  //   ),
                                  // );
                                  if (_formKey.currentState!.validate()) {
                                    print(
                                        "password is ${controller.masterInputController.text}");
                                    print(
                                        "password is ${controller.masterInputOneController.text}");
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(22)),
                                          insetPadding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Container(
                                            width:
                                                kIsWeb ? 428 : double.infinity,
                                            child: ForgotPasswordOneDialog(Get.put(
                                                ForgotPasswordOneController())),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                                height: 50.h,
                                width: 388,
                                text: "lbl_continue".tr,
                                margin: getMargin(top: 32)),
                          ]))),
            )),
      ),
    );
  }

  onTapArrowleft3() {
    Get.back();
  }
}
