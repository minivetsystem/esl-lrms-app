import '../controller/history_controller.dart';
import '../models/history_item_model.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';

// ignore: must_be_immutable
class HistoryItemWidget extends StatelessWidget {
  HistoryItemWidget(this.historyItemModelObj);

  HistoryItemModel historyItemModelObj;

  var controller = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: getPadding(
        all: 16,
      ),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: getPadding(
              top: 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "msg_25_dec_2022_10_50".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSFUITextBold17Width700black.copyWith(
                        height: getVerticalSize(
                          1.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 5,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "lbl_large_truck2".tr,
                              style: TextStyle(
                                color: ColorConstant.gray600,
                                fontSize: getFontSize(
                                  17,
                                ),
                                fontFamily: 'SF UI Text',
                                fontWeight: FontWeight.w400,
                                height: getVerticalSize(
                                  1.5,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: "lbl_rjgj6592".tr,
                              style: TextStyle(
                                color: ColorConstant.gray600,
                                fontSize: getFontSize(
                                  17,
                                ),
                                fontFamily: 'SF UI Text',
                                fontWeight: FontWeight.w400,
                                height: getVerticalSize(
                                  1.08,
                                ),
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 15,
                      ),
                      child: Row(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgLocationGray600,
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
                              "Naperville",
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
                    Padding(
                      padding: getPadding(
                        top: 16,
                      ),
                      child: Row(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgLocationGray60024x24,
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
                              top: 3,
                            ),
                            child: Text(
                              "Austin",
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
                Padding(
                  padding: getPadding(
                    top: 14,
                    bottom: 90,
                  ),
                  child: Text(
                    "lbl_458_00".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSFUITextBold17blueA200.copyWith(
                      height: getVerticalSize(
                        1.08,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              top: 16,
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    onTap: (){
                      Get.toNamed(AppRoutes.historyOneScreen);
                    },
                    shape: ButtonShape
                        .RoundedBorder4,
                    height: 36,
                    width: 135,
                    text:
                    "lbl_view_details"
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


                // CustomButton(
                //   onTap: (){
                //     Get.toNamed(AppRoutes.historyOneScreen);
                //   },
                //   height: 36,
                //
                //   text: "lbl_view_details".tr,
                //   variant: ButtonVariant.OutlineblueA200_2,
                //   padding: ButtonPadding.PaddingAll9,
                //   fontStyle: ButtonFontStyle.SFUITextBold14,
                // ),
                SizedBox(
                  width: 10,
                ),
                // Container(
                //   width: getHorizontalSize(
                //     66.00,
                //   ),
                //   margin: getMargin(
                //     top: 4,
                //   ),
                //   padding: getPadding(
                //     left: 8,
                //     top: 3,
                //     right: 8,
                //     bottom: 3,
                //   ),
                //   decoration: AppDecoration.txtFillblue50.copyWith(
                //     borderRadius: BorderRadiusStyle.txtRoundedBorder4,
                //   ),
                //   child: Text(
                //     "lbl_pending".tr,
                //     overflow: TextOverflow.ellipsis,
                //     textAlign: TextAlign.center,
                //     style: AppStyle.txtSFUITextRegular13blueA200.copyWith(
                //       height: getVerticalSize(
                //         3.0,
                //       ),
                //     ),
                //   ),
                // ),
                CustomButton(
                    onTap: (){
                     
                    },
                    shape: ButtonShape
                        .RoundedBorder4,
                    height: 36,
                    width: 135,
                    text:
                     "lbl_pending"
                        .tr,
                    margin: getMargin(
                        bottom: 1),
                    variant: ButtonVariant
                        .OutlineredA200_2,
                    padding: ButtonPadding
                        .PaddingAll9,
                    fontStyle:
                    ButtonFontStyle
                        .SFUITextBold15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
