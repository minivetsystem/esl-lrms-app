import 'package:colorful_safe_area/colorful_safe_area.dart';

import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/custom_page.dart';
import 'controller/add_new_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';
import 'package:vedanta_lrms/widgets/custom_drop_down.dart';
import 'package:vedanta_lrms/widgets/custom_text_form_field.dart';

class AddNewCardScreen extends GetWidget<AddNewCardController> {
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
                    onTap: onTapArrowleft21),
                title: AppbarSubtitle(
                    text: "lbl_add_new_card2".tr, margin: getMargin(left: 16)),
                styleType: Style.bgFillblueA200),

            // CustomAppBar(
            //     height: getVerticalSize(56.00),
            //     leadingWidth: 52,
            //     leading: AppbarImage(
            //         height: getSize(32.00),
            //         width: getSize(32.00),
            //         svgPath: ImageConstant.imgArrowleft,
            //         margin: getMargin(left: 20, top: 12, bottom: 12),
            //         onTap: onTapArrowleft21),
            //     title: AppbarTitle(
            //         text: "lbl_add_new_card2".tr, margin: getMargin(left: 16))),
            body: Container(
                width: size.width,
                padding: getPadding(top: 10, bottom: 12, left: 0, right: 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        color: ColorConstant.whiteA700,
                        child: Padding(
                          padding: getPadding(
                              left: 20, right: 20, top: 16, bottom: 16),
                          child: Column(
                            children: [
                              CustomDropDown(
                                  width: double.infinity,
                                  focusNode: FocusNode(),
                                  icon: Container(
                                      margin: getMargin(left: 30, right: 16),
                                      child: CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowdownBlack900)),
                                  hintText: "lbl_card_type".tr,
                                  items: controller.addNewCardModelObj.value
                                      .dropdownItemList,
                                  onChanged: (value) {
                                    controller.onSelected(value);
                                  }),
                              CustomTextFormField(
                                  shadowTextfield: false,
                                  width: double.infinity,
                                  focusNode: FocusNode(),
                                  controller:
                                      controller.masterInputOneController,
                                  hintText: "lbl_565".tr,
                                  margin: getMargin(top: 16),
                                  padding: TextFormFieldPadding.PaddingAll14),
                              Padding(
                                  padding: getPadding(top: 16),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: getPadding(right: 8),
                                            child: CustomDropDown(
                                                focusNode: FocusNode(),
                                                icon: Container(
                                                    margin: getMargin(
                                                        left: 30, right: 16),
                                                    child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdownBlack900)),
                                                hintText: "lbl_25_5_2022".tr,
                                                items: controller
                                                    .addNewCardModelObj
                                                    .value
                                                    .dropdownItemList1,
                                                onChanged: (value) {
                                                  controller.onSelected1(value);
                                                }),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: getPadding(left: 8),
                                            child: CustomTextFormField(
                                                shadowTextfield: false,
                                                focusNode: FocusNode(),
                                                controller: controller
                                                    .masterInputThreeController,
                                                hintText: "lbl_658".tr,
                                                padding: TextFormFieldPadding
                                                    .PaddingAll14),
                                          ),
                                        )
                                      ])),
                              CustomTextFormField(
                                  shadowTextfield: false,
                                  width: double.infinity,
                                  focusNode: FocusNode(),
                                  controller:
                                      controller.masterInputFourController,
                                  hintText: "lbl_zohn_bell".tr,
                                  margin: getMargin(top: 16),
                                  padding: TextFormFieldPadding.PaddingAll14,
                                  textInputAction: TextInputAction.done),
                              CustomButton(
                                  onTap: () {
                                    Get.back();
                                  },
                                  height: 50,
                                  width: 388,
                                  text: "lbl_add".tr,
                                  margin: getMargin(top: 32)),
                            ],
                          ),
                        ),
                      ),
                    ]))));
  }

  onTapArrowleft21() {
    Get.back();
  }
}
