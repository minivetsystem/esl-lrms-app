import 'controller/payment_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class PaymentOneDialog extends StatelessWidget {
  PaymentOneDialog(this.controller);

  PaymentOneController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 16,
        top: 24,
        right: 16,
        bottom: 24,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder28,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            svgPath: ImageConstant.imgGroupGreenA400,
            height: getVerticalSize(
              102.00,
            ),
            width: getHorizontalSize(
              108.00,
            ),
            margin: getMargin(
              top: 2,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 20,
            ),
            child: Text(
              "msg_payment_successfull".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSFUITextBold17.copyWith(
                height: getVerticalSize(
                  1.08,
                ),
              ),
            ),
          ),
          Container(
            width: getHorizontalSize(
              294.00,
            ),
            margin: getMargin(
              top: 7,
            ),
            child: Text(
              "msg_lorem_ipsum_dolor8".tr,
              maxLines: null,
              textAlign: TextAlign.center,
              style: AppStyle.txtSFUITextRegular17Gray600.copyWith(
                height: getVerticalSize(
                  1.08,
                ),
              ),
            ),
          ),
          CustomButton(
            height: 50,
            width: 356,
            text: "lbl_done".tr,
            margin: getMargin(
              top: 13,
            ),
          ),
        ],
      ),
    );
  }
}
