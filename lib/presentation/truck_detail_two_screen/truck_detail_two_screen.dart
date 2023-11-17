import 'package:colorful_safe_area/colorful_safe_area.dart';

import '../../widgets/custom_page.dart';
import 'controller/truck_detail_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_image.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:truck_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:truck_booking_app/widgets/custom_text_form_field.dart';

class TruckDetailTwoScreen extends GetWidget<TruckDetailTwoController> {
  @override
  Widget build(BuildContext context) {
    return CustomPage(widget: get_page());
  }

// ignore: non_constant_identifier_names
  Widget get_page() {
    return ColorfulSafeArea(
        minimum: EdgeInsets.only(top: 20),
        color: ColorConstant.whiteA700,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
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
                    onTap: () {
                      Get.back();
                    }),
                title: AppbarSubtitle(
                    text: "lbl_jane_cooper".tr, margin: getMargin(left: 16)),
                styleType: Style.bgFillblueA200),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    child: ListView(
                      children: [
                        Padding(
                            padding: getPadding(left: 20, top: 24, right: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgEllipse8,
                                        height: getSize(32.00),
                                        width: getSize(32.00),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(16.00))),
                                    Container(
                                        margin: getMargin(left: 8),
                                        padding: getPadding(
                                            left: 8,
                                            top: 6,
                                            right: 8,
                                            bottom: 6),
                                        decoration: AppDecoration
                                            .fillChateMessege
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .customBorderBL20),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      top: 6, bottom: 6),
                                                  child: Text(
                                                      "msg_hii_there_how_are"
                                                          .tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSFUITextRegular15Black900
                                                          .copyWith(
                                                              height:
                                                                  getVerticalSize(
                                                                      1.5))))
                                            ]))
                                  ]),
                                  Padding(
                                      padding: getPadding(left: 32, top: 1),
                                      child: Text("lbl_9_20_am".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSFUITextRegular13
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(1.5)))),
                                  // CustomButton(
                                  //     height: 32,
                                  //     width: 154,
                                  //     text: "msg_i_am_great_thanks".tr,
                                  //     margin: getMargin(top: 16),
                                  //     shape: ButtonShape.CustomBorderBL20,
                                  //     padding: ButtonPadding.PaddingAll4,
                                  //     fontStyle: ButtonFontStyle.SFUITextRegular15,
                                  //     alignment: Alignment.centerRight),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                          margin: getMargin(top: 8),
                                          padding: getPadding(
                                              left: 8,
                                              top: 12,
                                              right: 8,
                                              bottom: 12),
                                          decoration: AppDecoration.fillblueA200
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .customBorderBL20),
                                          child: Text(
                                              "msg_i_am_great_thanks".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular15WhiteA700
                                                  .copyWith(
                                                      height: getVerticalSize(
                                                          1.5))))),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                          margin: getMargin(top: 8),
                                          padding: getPadding(
                                              left: 8,
                                              top: 12,
                                              right: 8,
                                              bottom: 12),
                                          decoration: AppDecoration.fillblueA200
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .customBorderBL20),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text("lbl_how_are_you".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtSFUITextRegular15WhiteA700
                                                        .copyWith(
                                                            height:
                                                                getVerticalSize(
                                                                    1.5)))
                                              ]))),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding: getPadding(top: 1),
                                          child: Text("lbl_9_25_am".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFUITextRegular13
                                                  .copyWith(
                                                      height: getVerticalSize(
                                                          1.5))))),
                                  Padding(
                                      padding: getPadding(top: 16),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgEllipse8,
                                                height: getSize(32.00),
                                                width: getSize(32.00),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(16.00)),
                                                margin: getMargin(bottom: 40)),
                                            Container(
                                                margin: getMargin(left: 8),
                                                padding: getPadding(
                                                    left: 11,
                                                    top: 12,
                                                    right: 11,
                                                    bottom: 12),
                                                decoration: AppDecoration
                                                    .fillChateMessege
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .customBorderBL20),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  158.00),
                                                          margin: getMargin(
                                                              bottom: 1),
                                                          child: Text(
                                                              "I Fine’ Thanks. Can You Send Me My Newest Schedule?",
                                                              maxLines: null,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtSFUITextRegular15Black900
                                                                  .copyWith(
                                                                      height: getVerticalSize(
                                                                          1.5))))
                                                    ]))
                                          ])),
                                  Padding(
                                      padding: getPadding(left: 32, top: 1),
                                      child: Text("lbl_9_20_am".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSFUITextRegular13
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(1.5)))),
                                ])),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(left: 20, right: 20, top: 16, bottom: 16),
                  child: Container(
                      height: getVerticalSize(48),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: ColorConstant.whiteA700),
                      padding: getPadding(top: 0, bottom: 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgTrash,
                                height: getSize(24.00),
                                width: getSize(24.00)),
                            CustomTextFormField(
                                shadowTextfield: false,
                                function: () {},
                                width: 240,
                                focusNode: FocusNode(),
                                controller:
                                    controller.groupEightyFourController,
                                hintText: "lbl_type_a_message".tr,
                                margin: getMargin(top: 3),
                                variant: TextFormFieldVariant.None,
                                fontStyle:
                                    TextFormFieldFontStyle.SFUITextRegular17,
                                textInputAction: TextInputAction.done),
                            CustomImageView(
                                svgPath: ImageConstant.imgCamera,
                                height: getSize(24.00),
                                width: getSize(24.00),
                                onTap: () {
                                  onTapImgCamera();
                                }),
                            CustomImageView(
                                svgPath: ImageConstant.imgArrowright,
                                height: getSize(24.00),
                                width: getSize(24.00))
                          ])),
                ),
              ],
            )));
  }

  onTapImgCamera() async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    await FileManager().showModelSheetForImage(getImages: (value) async {});
  }

  onTapArrowleft8() {
    Get.back();
  }
}
