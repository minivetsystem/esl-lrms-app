import '../controller/ticket_preview_controller.dart';
import '../models/ticket_preview_item_model.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';

// ignore: must_be_immutable
class TicketPreviewItemWidget extends StatelessWidget {
  TicketPreviewItemWidget(this.ticketPreviewItemModelObj);

  TicketPreviewItemModel ticketPreviewItemModelObj;

  var controller = Get.find<TicketPreviewController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          svgPath: ImageConstant.imgFile,
          height: getSize(
            24.00,
          ),
          width: getSize(
            24.00,
          ),
        ),
        Padding(
          padding: getPadding(
            left: 16,
            top: 1,
            bottom: 1,
          ),
          child: Text(
            "lbl_lorem2".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtSFUITextRegular17.copyWith(
              height: getVerticalSize(
                1.08,
              ),
            ),
          ),
        ),
        Spacer(
          flex: 50,
        ),
        Padding(
          padding: getPadding(
            top: 2,
          ),
          child: Text(
            "lbl_23_nov_2023".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtSFUITextRegular17Gray600.copyWith(
              height: getVerticalSize(
                1.08,
              ),
            ),
          ),
        ),
        Spacer(
          flex: 49,
        ),
        Padding(
          padding: getPadding(
            top: 1,
            bottom: 1,
          ),
          child: Text(
            "lbl_8_30".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtSFUITextRegular17Gray600.copyWith(
              height: getVerticalSize(
                1.08,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
