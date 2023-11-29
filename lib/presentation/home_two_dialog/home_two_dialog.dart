import '../home_two_dialog/widgets/home_two_item_widget.dart';
import 'controller/home_two_controller.dart';
import 'models/home_two_item_model.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';
import 'package:vedanta_lrms/widgets/custom_drop_down.dart';

// ignore_for_file: must_be_immutable
class HomeTwoDialog extends StatelessWidget {
  HomeTwoDialog(this.controller);

  HomeTwoController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 16,
        top: 32,
        right: 16,
        bottom: 32,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder28,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "lbl_select_date".tr,
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
              top: 32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDropDown(
                  width: 162,
                  focusNode: FocusNode(),
                  icon: Container(
                    padding: getPadding(
                      left: 30,
                      top: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    margin: getMargin(),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray100,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          4.00,
                        ),
                      ),
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgArrowdownBlack900,
                    ),
                  ),
                  hintText: "lbl_select_month".tr,
                  variant: DropDownVariant.OutlineBlack900,
                  fontStyle: DropDownFontStyle.SFUITextRegular15Black900,
                  items: controller.homeTwoModelObj.value.dropdownItemList,
                  onChanged: (value) {
                    controller.onSelected(value);
                  },
                ),
                CustomDropDown(
                  width: 162,
                  focusNode: FocusNode(),
                  icon: Container(
                    padding: getPadding(
                      left: 30,
                      top: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    margin: getMargin(),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray100,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          4.00,
                        ),
                      ),
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgArrowdownGray600,
                    ),
                  ),
                  hintText: "lbl_select_year".tr,
                  variant: DropDownVariant.OutlineGray300,
                  items: controller.homeTwoModelObj.value.dropdownItemList1,
                  onChanged: (value) {
                    controller.onSelected1(value);
                  },
                ),
              ],
            ),
          ),
          Container(
            height: getVerticalSize(
              285.00,
            ),
            width: getHorizontalSize(
              349.00,
            ),
            margin: getMargin(
              top: 4,
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: getPadding(
                      left: 6,
                      top: 20,
                      bottom: 53,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "lbl_s".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextBold17blueA200
                                        .copyWith(
                                      height: getVerticalSize(
                                        1.08,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 5,
                                    top: 17,
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
                                Padding(
                                  padding: getPadding(
                                    left: 5,
                                    top: 17,
                                  ),
                                  child: Text(
                                    "lbl_8".tr,
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
                                    left: 1,
                                    top: 17,
                                  ),
                                  child: Text(
                                    "lbl_15".tr,
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
                                    top: 16,
                                  ),
                                  child: Text(
                                    "lbl_22".tr,
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
                                    top: 17,
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
                              ],
                            ),
                            Padding(
                              padding: getPadding(
                                left: 32,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "lbl_m".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtSFUITextBold17blueA200
                                          .copyWith(
                                        height: getVerticalSize(
                                          1.08,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: getPadding(
                                        top: 16,
                                      ),
                                      child: Text(
                                        "lbl_2".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtSFUITextRegular17Gray600
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
                                      top: 17,
                                      right: 5,
                                    ),
                                    child: Text(
                                      "lbl_9".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtSFUITextRegular17Gray600
                                          .copyWith(
                                        height: getVerticalSize(
                                          1.08,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 17,
                                      right: 1,
                                    ),
                                    child: Text(
                                      "lbl_16".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtSFUITextRegular17Gray600
                                          .copyWith(
                                        height: getVerticalSize(
                                          1.08,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 17,
                                    ),
                                    child: Text(
                                      "lbl_23".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtSFUITextRegular17Gray600
                                          .copyWith(
                                        height: getVerticalSize(
                                          1.08,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 17,
                                    ),
                                    child: Text(
                                      "lbl_30".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtSFUITextRegular17Gray600
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
                        Container(
                          height: getVerticalSize(
                            172.00,
                          ),
                          width: getHorizontalSize(
                            32.00,
                          ),
                          margin: getMargin(
                            bottom: 38,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: getPadding(
                                    left: 6,
                                    right: 5,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: getPadding(
                                          right: 4,
                                        ),
                                        child: Text(
                                          "lbl_t".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSFUITextBold17blueA200
                                              .copyWith(
                                            height: getVerticalSize(
                                              1.08,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          top: 17,
                                          right: 4,
                                        ),
                                        child: Text(
                                          "lbl_3".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSFUITextRegular17Gray600
                                              .copyWith(
                                            height: getVerticalSize(
                                              1.08,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: getPadding(
                                            top: 17,
                                          ),
                                          child: Text(
                                            "lbl_10".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSFUITextRegular17Gray600
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
                                          top: 54,
                                        ),
                                        child: Text(
                                          "lbl_24".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSFUITextRegular17Gray600
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
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: getSize(
                                    32.00,
                                  ),
                                  margin: getMargin(
                                    bottom: 32,
                                  ),
                                  padding: getPadding(
                                    left: 7,
                                    top: 5,
                                    right: 7,
                                    bottom: 5,
                                  ),
                                  decoration:
                                      AppDecoration.txtFillblueA200.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.txtCircleBorder16,
                                  ),
                                  child: Text(
                                    "lbl_17".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtSFUITextRegular17WhiteA700
                                        .copyWith(
                                      height: getVerticalSize(
                                        1.08,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: getVerticalSize(
                            211.00,
                          ),
                          child: Obx(
                            () => ListView.separated(
                              padding: getPadding(
                                left: 27,
                                bottom: 38,
                              ),
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: getVerticalSize(
                                    32.00,
                                  ),
                                );
                              },
                              itemCount: controller
                                  .homeTwoModelObj.value.homeTwoItemList.length,
                              itemBuilder: (context, index) {
                                HomeTwoItemModel model = controller
                                    .homeTwoModelObj
                                    .value
                                    .homeTwoItemList[index];
                                return HomeTwoItemWidget(
                                  model,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: getPadding(
                      right: 9,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
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
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: getPadding(
                      left: 3,
                      top: 16,
                      right: 3,
                      bottom: 16,
                    ),
                    decoration: AppDecoration.fillGray100.copyWith(
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
                          child: Text(
                            "lbl_january".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFUITextRegular17.copyWith(
                              height: getVerticalSize(
                                1.08,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 24,
                          ),
                          child: Text(
                            "lbl_febuary".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFUITextRegular17.copyWith(
                              height: getVerticalSize(
                                1.08,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 23,
                          ),
                          child: Text(
                            "lbl_march".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFUITextRegular17.copyWith(
                              height: getVerticalSize(
                                1.08,
                              ),
                            ),
                          ),
                        ),
                        CustomButton(
                          height: 32,
                          width: 156,
                          text: "lbl_april".tr,
                          margin: getMargin(
                            top: 19,
                          ),
                          shape: ButtonShape.Square,
                          padding: ButtonPadding.PaddingAll4,
                          fontStyle: ButtonFontStyle.SFUITextRegular17,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 21,
                          ),
                          child: Text(
                            "lbl_may".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFUITextRegular17.copyWith(
                              height: getVerticalSize(
                                1.08,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 23,
                          ),
                          child: Text(
                            "lbl_june".tr,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
