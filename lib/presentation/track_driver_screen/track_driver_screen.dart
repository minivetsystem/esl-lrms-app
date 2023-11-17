import 'package:colorful_safe_area/colorful_safe_area.dart';

import '../../widgets/custom_page.dart';
import 'controller/track_driver_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_image.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:truck_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:truck_booking_app/widgets/custom_button.dart';
import 'package:truck_booking_app/widgets/custom_text_form_field.dart';

class TrackDriverScreen extends GetWidget<TrackDriverController> {
  @override
  Widget build(BuildContext context) {
    return CustomPage(widget: get_page());
  }

  // ignore: non_constant_identifier_names
  Widget get_page() {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: ColorfulSafeArea(
          minimum: EdgeInsets.only(top: 20),
          color: ColorConstant.whiteA700,
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: ColorConstant.lightGray,
              appBar: CustomAppBar(
                  // minimum:EdgeInsets.only(top: 20),
                  height: getVerticalSize(57.00),
                  leadingWidth: 44,
                  leading: AppbarImage(
                      height: getSize(24.00),
                      width: getSize(24.00),
                      svgPath: ImageConstant.imgArrowleftWhiteA700,
                      margin: getMargin(left: 20, top: 17, bottom: 16),
                      onTap: onTapArrowleft18),
                  title: AppbarSubtitle(
                      text: "lbl_track_driver".tr, margin: getMargin(left: 16)),
                  styleType: Style.bgFillblueA200),
              body: Container(
                  width: size.width,
                  padding: getPadding(left: 0, top: 15, right: 0, bottom: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          color: ColorConstant.whiteA700,
                          child: Padding(
                            padding: getPadding(
                                top: 16, left: 20, bottom: 16, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(top: 9),
                                    child: Text("msg_to_track_your_driver".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtSFUITextRegular15Black900
                                            .copyWith(
                                                height:
                                                    getVerticalSize(1.12)))),
                                CustomTextFormField(
                                    shadowTextfield: false,
                                    width: double.infinity,
                                    focusNode: FocusNode(),
                                    controller:
                                        controller.masterInputController,
                                    hintText: "lbl_reference_id".tr,
                                    margin: getMargin(top: 25),
                                    padding: TextFormFieldPadding.PaddingAll14,
                                    textInputAction: TextInputAction.done),
                                CustomButton(
                                    onTap: () {
                                      Get.toNamed(
                                          AppRoutes.trackDriverOneScreen);
                                    },
                                    height: 50,
                                    width: 388,
                                    text: "lbl_start_tracking".tr,
                                    margin: getMargin(top: 24)),
                              ],
                            ),
                          ),
                        )
                      ])))),
    );
  }

  onTapArrowleft18() {
    Get.back();
  }
}
