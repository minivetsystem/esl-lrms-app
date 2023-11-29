import 'package:colorful_safe_area/colorful_safe_area.dart';

import '../../widgets/custom_page.dart';
import 'controller/history_empty_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';

class HistoryEmptyScreen extends GetWidget<HistoryEmptyController> {
  @override
  Widget build(BuildContext context) {
    return CustomPage(widget: get_page());
  }

// ignore: non_constant_identifier_names
  Widget get_page() {
    return ColorfulSafeArea(
        color: ColorConstant.blue,
        child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          appBar: CustomAppBar(
              height: getVerticalSize(57.00),
              leadingWidth: 44,
              leading: AppbarImage(
                  height: getSize(24.00),
                  width: getSize(24.00),
                  svgPath: ImageConstant.imgArrowleftWhiteA700,
                  margin: getMargin(left: 20, top: 17, bottom: 16),
                  onTap: onTapArrowleft15),
              centerTitle: true,
              title: AppbarSubtitle(text: "lbl_history".tr),
              styleType: Style.bgFillblueA200),
          body: Container(
              width: size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("msg_no_booking_found".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtSFUITextBold17
                              .copyWith(height: getVerticalSize(1.08))),
                    )
                  ])),
        ));
  }

  onTapArrowleft15() {
    Get.back();
  }
}
