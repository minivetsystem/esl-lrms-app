import 'package:vedanta_lrms/presentation/login_screen_one_screen/login_screen_one_screen.dart';

import 'controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ProfileDialog extends StatelessWidget {
  ProfileDialog(this.controller);

  ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 16,
        top: 30,
        right: 16,
        bottom: 30,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder28,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: getPadding(
              top: 3,
            ),
            child: Text(
              "lbl_log_out2".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppStyle.txtSFUITextBold17.copyWith(
                height: getVerticalSize(
                  1.08,
                ),
              ),
            ),
          ),
          Container(
            width: getHorizontalSize(
              339.00,
            ),
            margin: getMargin(
              top: 14,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "msg_you_ll_have_to_enter2".tr,
                    style: TextStyle(
                      color: ColorConstant.gray600,
                      fontSize: getFontSize(
                        17,
                      ),
                      fontFamily: 'SF UI Text',
                      fontWeight: FontWeight.w400,
                      height: getVerticalSize(
                        1.08,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: "msg_you_ll_have_to_enter2".tr,
                    style: TextStyle(
                      color: ColorConstant.gray600,
                      fontSize: getFontSize(
                        17,
                      ),
                      fontFamily: 'SF UI Text',
                      fontWeight: FontWeight.w400,
                      height: getVerticalSize(
                        1.5,
                      ),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: getPadding(
                top: 29,
                right: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap:(){Get.back();},
                    child: Padding(
                      padding: getPadding(
                        bottom: 1,
                      ),
                      child: Text(
                        "lbl_cancel".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSFUITextRegular17.copyWith(
                          height: getVerticalSize(
                            1.08,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      PrefUtils.setIsSignIn(true);
                      Get.off(LoginScreenOneScreen());
                    },
                    child: Padding(
                      padding: getPadding(
                        left: 32,
                        top: 1,
                      ),
                      child: Text(
                        "lbl_log_out".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSFUITextRegular17.copyWith(
                          height: getVerticalSize(
                            1.08,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
