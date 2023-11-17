import 'controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_image.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:truck_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:truck_booking_app/widgets/custom_text_form_field.dart';

class SearchScreen extends GetWidget<CustomSearchController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(57.00),
                leadingWidth: 44,
                leading: AppbarImage(
                    height: getSize(24.00),
                    width: getSize(24.00),
                    svgPath: ImageConstant.imgArrowleftWhiteA700,
                    margin: getMargin(left: 20, top: 17, bottom: 16),
                    onTap: onTapArrowleft5),
                centerTitle: true,
                title: AppbarSubtitle(text: "lbl_search".tr),
                styleType: Style.bgFillblueA200),
            body: Container(
                width: size.width,
                padding: getPadding(left: 20, top: 15, right: 20, bottom: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                          shadowTextfield: false,
                          width: 388,
                          focusNode: FocusNode(),
                          controller: controller.group268Controller,
                          hintText: "lbl_search_location".tr,
                          margin: getMargin(top: 1),
                          variant: TextFormFieldVariant.OutlineGray400,
                          shape: TextFormFieldShape.RoundedBorder10,
                          padding: TextFormFieldPadding.PaddingT14_1,
                          fontStyle: TextFormFieldFontStyle.SFUITextRegular17,
                          textInputAction: TextInputAction.done,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 12, right: 8, bottom: 12),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgContrast)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48.00)),
                          suffix: Container(
                              margin: getMargin(
                                  left: 30, top: 12, right: 16, bottom: 12),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgMicrophone)),
                          suffixConstraints: BoxConstraints(
                              maxHeight: getVerticalSize(48.00))),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Text("lbl_recent".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSFUITextBold17
                                  .copyWith(height: getVerticalSize(1.08)))),
                      Padding(
                          padding: getPadding(top: 17),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgContrast,
                                height: getSize(20.00),
                                width: getSize(20.00),
                                margin: getMargin(bottom: 1)),
                            Padding(
                                padding: getPadding(left: 16),
                                child: Text("lbl_lorem_ipsum2".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextRegular17Gray600
                                        .copyWith(
                                            height: getVerticalSize(1.08))))
                          ])),
                      Padding(
                          padding: getPadding(top: 15),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgContrast,
                                height: getSize(20.00),
                                width: getSize(20.00)),
                            Padding(
                                padding: getPadding(left: 16),
                                child: Text("lbl_lorem".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextRegular17Gray600
                                        .copyWith(
                                            height: getVerticalSize(1.08))))
                          ])),
                      Padding(
                          padding: getPadding(top: 17),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgContrast,
                                height: getSize(20.00),
                                width: getSize(20.00),
                                margin: getMargin(bottom: 1)),
                            Padding(
                                padding: getPadding(left: 16),
                                child: Text("msg_lorem_ipsum_sit".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextRegular17Gray600
                                        .copyWith(
                                            height: getVerticalSize(1.08))))
                          ])),
                      Padding(
                          padding: getPadding(top: 16),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgContrast,
                                height: getSize(20.00),
                                width: getSize(20.00),
                                margin: getMargin(bottom: 1)),
                            Padding(
                                padding: getPadding(left: 16),
                                child: Text("msg_lorem_ipsum_dolor2".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextRegular17Gray600
                                        .copyWith(
                                            height: getVerticalSize(1.08))))
                          ])),
                      Padding(
                          padding: getPadding(top: 16),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgContrast,
                                height: getSize(20.00),
                                width: getSize(20.00),
                                margin: getMargin(bottom: 1)),
                            Padding(
                                padding: getPadding(left: 16),
                                child: Text("lbl_lorem_ipsum2".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextRegular17Gray600
                                        .copyWith(
                                            height: getVerticalSize(1.08))))
                          ])),
                      Padding(
                          padding: getPadding(top: 16),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgContrast,
                                height: getSize(20.00),
                                width: getSize(20.00),
                                margin: getMargin(bottom: 1)),
                            Padding(
                                padding: getPadding(left: 16),
                                child: Text("msg_lorem_ipsum_dolor3".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextRegular17Gray600
                                        .copyWith(
                                            height: getVerticalSize(1.08))))
                          ])),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(top: 31),
                              child: Text("lbl_clear_all".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFUITextBold18blueA200
                                      .copyWith(
                                          height: getVerticalSize(1.07))))),
                      Spacer(),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(5.00),
                              width: getHorizontalSize(135.00),
                              decoration: BoxDecoration(
                                  color: ColorConstant.black900,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(2.00)))))
                    ]))));
  }

  onTapArrowleft5() {
    Get.back();
  }
}
