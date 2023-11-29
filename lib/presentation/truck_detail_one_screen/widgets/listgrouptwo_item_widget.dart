import '../controller/truck_detail_one_controller.dart';
import '../models/listgrouptwo_item_model.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';

// ignore: must_be_immutable
class ListgrouptwoItemWidget extends StatelessWidget {
  ListgrouptwoItemWidget(this.listgrouptwoItemModelObj);

  ListgrouptwoItemModel listgrouptwoItemModelObj;

  var controller = Get.find<TruckDetailOneController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        all: 16,
      ),
      decoration: AppDecoration.outlineGray30001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgGroup2,
                height: getSize(
                  32.00,
                ),
                width: getSize(
                  32.00,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 8,
                  top: 5,
                  bottom: 5,
                ),
                child: Text(
                  "lbl_truck_name".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSFUITextBold17.copyWith(
                    height: getVerticalSize(
                      1.08,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: getPadding(
                  top: 5,
                  bottom: 5,
                ),
                child: Text(
                  "lbl_658_00".tr,
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
          Padding(
            padding: getPadding(
              top: 24,
            ),
            child: Row(
              children: [
                Padding(
                  padding: getPadding(
                    bottom: 1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_1_48_pm".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSFUITextBold17.copyWith(
                          height: getVerticalSize(
                            1.08,
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 5,
                        ),
                        child: Text(
                          "lbl_lorem2".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSFUITextRegular15.copyWith(
                            height: getVerticalSize(
                              1.12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 40,
                    top: 12,
                    bottom: 11,
                  ),
                  child: Text(
                    "lbl_1_h_20_min".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSFUITextRegular17blueA200.copyWith(
                      height: getVerticalSize(
                        1.08,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_4_58_pm".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSFUITextBold17.copyWith(
                          height: getVerticalSize(
                            1.08,
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 6,
                        ),
                        child: Text(
                          "lbl_ipsum".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSFUITextRegular15.copyWith(
                            height: getVerticalSize(
                              1.12,
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
          Padding(
            padding: getPadding(
              top: 21,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  height: 36,
                  width: 71,
                  text: "lbl_2".tr,
                  variant: ButtonVariant.OutlineBlack90016,
                  padding: ButtonPadding.PaddingT7,
                  fontStyle: ButtonFontStyle.SFUITextRegular17Gray600,
                  suffixWidget: Container(
                    margin: getMargin(
                      left: 8,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgUserGray600,
                    ),
                  ),
                ),
                CustomButton(
                  height: 36,
                  width: 92,
                  text: "lbl_detail".tr,
                  padding: ButtonPadding.PaddingAll9,
                  fontStyle: ButtonFontStyle.SFUITextBold14WhiteA700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
