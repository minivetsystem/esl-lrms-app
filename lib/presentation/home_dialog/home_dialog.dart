import 'controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class HomeDialog extends StatelessWidget {
  HomeDialog(this.controller);

  HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        all: 32,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder28,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(
              bottom: 46,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "lbl_select_time".tr,
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
                    top: 25,
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: getPadding(
                                left: 26,
                              ),
                              child: Text(
                                "lbl_1".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFUITextRegular17Gray600
                                    .copyWith(
                                  height: getVerticalSize(
                                    1.08,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 24,
                            ),
                            child: Text(
                              "lbl_2".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                                  AppStyle.txtSFUITextRegular17Gray600.copyWith(
                                height: getVerticalSize(
                                  1.08,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              1.00,
                            ),
                            width: getHorizontalSize(
                              63.00,
                            ),
                            margin: getMargin(
                              top: 24,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.gray300,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 15,
                            ),
                            child: Text(
                              "lbl_3".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                                  AppStyle.txtSFUITextBold21Black900.copyWith(
                                height: getVerticalSize(
                                  1.04,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              1.00,
                            ),
                            width: getHorizontalSize(
                              63.00,
                            ),
                            margin: getMargin(
                              top: 12,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.gray300,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 24,
                            ),
                            child: Text(
                              "lbl_4".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                                  AppStyle.txtSFUITextRegular17Gray600.copyWith(
                                height: getVerticalSize(
                                  1.08,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 25,
                            ),
                            child: Text(
                              "lbl_5".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                                  AppStyle.txtSFUITextRegular17Gray600.copyWith(
                                height: getVerticalSize(
                                  1.08,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: getPadding(
                          left: 15,
                          top: 106,
                          bottom: 99,
                        ),
                        child: Text(
                          "lbl2".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSFUITextBold27.copyWith(
                            height: getVerticalSize(
                              1.02,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 23,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "lbl_28".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                                  AppStyle.txtSFUITextRegular17Gray600.copyWith(
                                height: getVerticalSize(
                                  1.08,
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 24,
                              ),
                              child: Text(
                                "lbl_29".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFUITextRegular17Gray600
                                    .copyWith(
                                  height: getVerticalSize(
                                    1.08,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: getVerticalSize(
                                1.00,
                              ),
                              width: getHorizontalSize(
                                63.00,
                              ),
                              margin: getMargin(
                                top: 24,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.gray300,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 15,
                              ),
                              child: Text(
                                "lbl_30".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    AppStyle.txtSFUITextBold21Black900.copyWith(
                                  height: getVerticalSize(
                                    1.04,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: getVerticalSize(
                                1.00,
                              ),
                              width: getHorizontalSize(
                                63.00,
                              ),
                              margin: getMargin(
                                top: 12,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.gray300,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 24,
                              ),
                              child: Text(
                                "lbl_31".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFUITextRegular17Gray600
                                    .copyWith(
                                  height: getVerticalSize(
                                    1.08,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 25,
                              ),
                              child: Text(
                                "lbl_32".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFUITextRegular17Gray600
                                    .copyWith(
                                  height: getVerticalSize(
                                    1.08,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 2,
              top: 149,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomButton(
                  height: 32,
                  width: 74,
                  text: "lbl_pm".tr,
                  margin: getMargin(
                    right: 9,
                  ),
                  padding: ButtonPadding.PaddingAll4,
                  fontStyle: ButtonFontStyle.SFUITextRegular17,
                ),
                Padding(
                  padding: getPadding(
                    top: 8,
                    right: 33,
                  ),
                  child: Text(
                    "lbl_am".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSFUITextRegular17Gray600.copyWith(
                      height: getVerticalSize(
                        1.08,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 98,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "lbl_cancel".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSFUITextRegular17Gray600.copyWith(
                          height: getVerticalSize(
                            1.08,
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 32,
                        ),
                        child: Text(
                          "lbl_ok".tr,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
