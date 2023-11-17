import 'package:colorful_safe_area/colorful_safe_area.dart';

import '../../widgets/custom_page.dart';
import 'controller/search_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_image.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:truck_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:truck_booking_app/widgets/custom_text_form_field.dart';

class SearchOneScreen extends GetWidget<SearchOneController> {
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
          minimum: EdgeInsets.only(top: 32),
          color: ColorConstant.whiteA700,
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: ColorConstant.lightGray,
              appBar: CustomAppBar(
                //minimum:EdgeInsets.only(top: 32),
                height: getVerticalSize(57.00),
                leadingWidth: 44,
                leading: AppbarImage(
                    height: getSize(32.00),
                    width: getSize(32.00),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 20, top: 12, bottom: 12),
                    onTap: () {
                      Get.back();
                    }),
                centerTitle: false,
                title: AppbarSubtitle(
                    text: "lbl_search".tr, margin: EdgeInsets.only(left: 16)),
              ),

              // CustomAppBar(
              //     height: getVerticalSize(57.00),
              //     leadingWidth: 44,
              //     leading: AppbarImage(
              //         height: getSize(24.00),
              //         width: getSize(24.00),
              //         svgPath: ImageConstant.imgArrowleftWhiteA700,
              //         margin: getMargin(left: 20, top: 17, bottom: 16),
              //         onTap: (){Get.back();}),
              //     centerTitle: true,
              //     title: AppbarSubtitle(text: "lbl_search".tr),
              //     styleType: Style.bgFillblueA200),
              body: Container(
                  width: size.width,
                  padding: getPadding(left: 0, top: 0, right: 0, bottom: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          color: ColorConstant.whiteA700,
                          child: Padding(
                            padding: getPadding(
                                top: 0, bottom: 16, left: 20, right: 20),
                            child: CustomTextFormField(
                                shadowTextfield: false,
                                onChanged: (value) {
                                  controller.setAdress(value);
                                },
                                onFieldSubmitted: (value) {
                                  Get.back();
                                },
                                function: () {
                                  // Get.to(AppRoutes.hom)
                                },
                                width: 388,
                                focusNode: FocusNode(),
                                controller: controller.group267Controller,
                                hintText: "lbl_search_location".tr,
                                margin: getMargin(top: 1),
                                variant: TextFormFieldVariant.OutlineGray400,
                                shape: TextFormFieldShape.RoundedBorder10,
                                padding: TextFormFieldPadding.PaddingT14_1,
                                fontStyle:
                                    TextFormFieldFontStyle.SFUITextRegular17,
                                textInputAction: TextInputAction.done,
                                prefix: Container(
                                    margin: getMargin(
                                        left: 16,
                                        top: 12,
                                        right: 8,
                                        bottom: 12),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgContrast)),
                                prefixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(48.00)),
                                suffix: Container(
                                    margin: getMargin(
                                        left: 30,
                                        top: 12,
                                        right: 16,
                                        bottom: 12),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgMicrophone)),
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(48.00))),
                          ),
                        ),
                        Padding(
                          padding: getPadding(top: 10),
                          child: Container(
                            width: double.infinity,
                            color: ColorConstant.whiteA700,
                            child: Padding(
                              padding:
                                  getPadding(left: 20, right: 20, bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: getPadding(top: 22),
                                      child: Text("lbl_recent".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSFUITextBold17
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(1.08)))),
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
                                            child: Text(
                                                "msg_lorem_ipsum_dolor3".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUITextRegular17Gray600
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.08))))
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
                                            child: Text(
                                                "msg_lorem_ipsum_dolor4".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUITextRegular17Gray600
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.08))))
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
                                            child: Text(
                                                "msg_lorem_ipsum_dolor5".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUITextRegular17Gray600
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.08))))
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
                                            child: Text(
                                                "msg_lorem_ipsum_consectetur"
                                                    .tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUITextRegular17Gray600
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.08))))
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
                                            child: Text(
                                                "msg_lorem_ipsum_dolor6".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUITextRegular17Gray600
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.08))))
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
                                            child: Text(
                                                "msg_lorem_amet_consectetur".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUITextRegular17Gray600
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.08))))
                                      ])),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: getPadding(top: 32),
                                          child: Text("lbl_clear_all".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextBold18blueA200
                                                  .copyWith(
                                                      height: getVerticalSize(
                                                          1.07))))),
                                ],
                              ),
                            ),
                          ),
                        )
                      ])))),
    );
  }

  onTapArrowleft6(context) {
    Get.back();
  }
}
