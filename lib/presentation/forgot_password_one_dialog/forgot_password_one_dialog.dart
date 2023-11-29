import 'package:vedanta_lrms/presentation/login_screen_one_screen/login_screen_one_screen.dart';

import 'controller/forgot_password_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordOneDialog extends StatelessWidget {
  ForgotPasswordOneDialog(this.controller);

  ForgotPasswordOneController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 18,
        top: 32,
        right: 18,
        bottom: 32,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder28,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDone608511060851100,
            height: getSize(
              108.00,
            ),
            width: getSize(
              108.00,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 25,
            ),
            child: Text(
              "msg_password_changed".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSFUITextBold17.copyWith(
                height: getVerticalSize(
                  1.2,
                ),
              ),
            ),
          ),
          Container(
            width: getHorizontalSize(
              316.00,
            ),
            margin: getMargin(
              top: 15,
            ),
            child: Text(
              "msg_your_password_has".tr,
              maxLines: null,
              textAlign: TextAlign.center,
              style: AppStyle.txtSFUITextRegular17Gray60001.copyWith(
                height: getVerticalSize(
                  1.5,
                ),
              ),
            ),
          ),
          CustomButton(
            onTap: () {
              Get.off(LoginScreenOneScreen());
            },
            height: 50,
            width: 180,
            text: "lbl_ok".tr,
            margin: getMargin(
              top: 21,
            ),
          ),
        ],
      ),
    );
  }
}
