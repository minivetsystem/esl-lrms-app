import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_page.dart';
import 'controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';

class NotificationScreen extends GetWidget<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return CustomPage(widget: get_page(context));
  }

// ignore: non_constant_identifier_names
  Widget get_page(context) {
    return WillPopScope(
      onWillPop: () async {
        Future.delayed(const Duration(milliseconds: 1000), () {
          SystemNavigator.pop();
        });
        return false;
      },
      child: ColorfulSafeArea(
          minimum: EdgeInsets.only(top: 20),
          color: ColorConstant.whiteA700,
          child: Scaffold(
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
                   Navigator.pop(context);
                    }),
                title: AppbarSubtitle(
                    text: "lbl_notification".tr, margin: getMargin(left: 16)),
                styleType: Style.bgFillblueA200),
            body: Container(
                width: size.width,
                padding: getPadding(left: 0, top: 16, right: 00, bottom: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          color: ColorConstant.whiteA700,
                          padding: getPadding(
                              top: 14, bottom: 14, left: 20, right: 20),
                          child: Stack(
                            children: [
                              Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgFillNotificationIcon,
                                                height: getSize(32.00),
                                                width: getSize(32.00),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(16.00)),
                                                margin: getMargin(
                                                    top: 0, bottom: 58)),
                                          ],
                                        ),
                                        Padding(
                                          padding: getPadding(left: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("msg_driver_has_arrived".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: AppStyle
                                                      .txtSFUITextRegular17Black400
                                                      .copyWith(
                                                          height:
                                                              getVerticalSize(
                                                                  1.5))),
                                              Padding(
                                                padding: getPadding(top: 16),
                                                child: Row(
                                                  children: [
                                                    CustomButton(
                                                        shape: ButtonShape
                                                            .RoundedBorder4,
                                                        height: 36,
                                                        width: 160,
                                                        text:
                                                            "lbl_procced_to_pay"
                                                                .tr,
                                                        margin: getMargin(
                                                            bottom: 1),
                                                        variant: ButtonVariant
                                                            .OutlineblueA200_2,
                                                        padding: ButtonPadding
                                                            .PaddingAll9,
                                                        fontStyle:
                                                            ButtonFontStyle
                                                                .SFUITextBold14),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                              Padding(
                                padding: getPadding(left: 290, top: 72),
                                child: Text("1 minuts ago",
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyle.txtSFUIText13Width400
                                        .copyWith(
                                            height: getVerticalSize(1.08))),
                              )
                            ],
                          )),
                      Container(
                          margin: getMargin(top: 5, bottom: 5),
                          padding: getPadding(
                              top: 14, bottom: 14, left: 20, right: 20),
                          color: ColorConstant.whiteA700,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant
                                            .imgFillNotificationIcon,
                                        height: getSize(32.00),
                                        width: getSize(32.00),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(16.00)),
                                        margin: getMargin(top: 1, bottom: 27)),
                                    Padding(
                                      padding: getPadding(left: 16),
                                      child: Container(
                                          height: getVerticalSize(60.00),
                                          width: getHorizontalSize(325.00),
                                          child: Stack(
                                              alignment: Alignment.bottomRight,
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                        width:
                                                            getHorizontalSize(
                                                                280.00),
                                                        child: Text(
                                                            "msg_welcome_to_moovers"
                                                                .tr,
                                                            maxLines: null,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtSFUITextRegular17Black400
                                                                .copyWith(
                                                                    height: getVerticalSize(
                                                                        1.5))))),
                                                Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Text("Just now",
                                                        textAlign:
                                                            TextAlign.left,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: AppStyle
                                                            .txtSFUIText13Width400
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.08))))
                                              ])),
                                    )
                                  ],
                                )
                              ])),
                      Container(
                          margin: getMargin(top: 5, bottom: 5),
                          padding: getPadding(
                              top: 14, bottom: 14, left: 20, right: 20),
                          color: ColorConstant.whiteA700,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant
                                            .imgFillNotificationIcon,
                                        height: getSize(32.00),
                                        width: getSize(32.00),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(16.00)),
                                        margin: getMargin(top: 1, bottom: 27)),
                                    Padding(
                                      padding: getPadding(left: 16),
                                      child: Container(
                                          height: getVerticalSize(60.00),
                                          width: getHorizontalSize(325.00),
                                          child: Stack(
                                              alignment: Alignment.bottomRight,
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                        width:
                                                            getHorizontalSize(
                                                                280.00),
                                                        child: Text(
                                                            "Your password has been successful added.",
                                                            maxLines: null,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtSFUITextRegular17Black400
                                                                .copyWith(
                                                                    height: getVerticalSize(
                                                                        1.5))))),
                                                Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Text("20 min ago",
                                                        textAlign:
                                                            TextAlign.left,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: AppStyle
                                                            .txtSFUIText13Width400
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.08))))
                                              ])),
                                    )
                                  ],
                                )
                              ])),
                      Container(
                          margin: getMargin(top: 5, bottom: 5),
                          padding: getPadding(
                              top: 14, bottom: 14, left: 20, right: 20),
                          color: ColorConstant.whiteA700,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant
                                            .imgFillNotificationIcon,
                                        height: getSize(32.00),
                                        width: getSize(32.00),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(16.00)),
                                        margin: getMargin(top: 1, bottom: 27)),
                                    Padding(
                                      padding: getPadding(left: 16),
                                      child: Container(
                                          height: getVerticalSize(60.00),
                                          width: getHorizontalSize(325.00),
                                          child: Stack(
                                              alignment: Alignment.bottomRight,
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                        width:
                                                            getHorizontalSize(
                                                                280.00),
                                                        child: Text(
                                                            "Thank you for booking a meeting with us.",
                                                            maxLines: null,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtSFUITextRegular17Black400
                                                                .copyWith(
                                                                    height: getVerticalSize(
                                                                        1.5))))),
                                                Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Text("30 min ago",
                                                        textAlign:
                                                            TextAlign.left,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: AppStyle
                                                            .txtSFUIText13Width400
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.08))))
                                              ])),
                                    )
                                  ],
                                )
                              ]))
                    ])),
          )),
    );
  }

  onTapArrowleft14(context) {}
}
