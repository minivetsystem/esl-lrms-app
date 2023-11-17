import 'controller/home_screen_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class HomeScreenTwoDialog extends StatelessWidget {
  HomeScreenTwoDialog(this.controller);

  HomeScreenTwoController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        top: 15,
        bottom: 15,
      ),
      decoration: AppDecoration.fillGray200.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder28,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: getPadding(
              top: 9,
            ),
            child: Text(
              "lbl_select_class".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSFUITextBold17.copyWith(
                height: getVerticalSize(
                  1.08,
                ),
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              top: 34,
            ),
            child: Text(
              "lbl_economy".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSFUITextRegular17.copyWith(
                height: getVerticalSize(
                  1.08,
                ),
              ),
            ),
          ),
          CustomButton(
            height: 40,
            width: 316,
            text: "lbl_business".tr,
            margin: getMargin(
              top: 17,
            ),
            shape: ButtonShape.Square,
            padding: ButtonPadding.PaddingAll9,
            fontStyle: ButtonFontStyle.SFUITextRegular17,
          ),
          Padding(
            padding: getPadding(
              top: 12,
            ),
            child: Text(
              "lbl_premium_economy".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSFUITextRegular17.copyWith(
                height: getVerticalSize(
                  1.08,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
