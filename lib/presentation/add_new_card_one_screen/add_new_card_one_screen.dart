import 'controller/add_new_card_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/core/utils/validation_functions.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_title.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';
import 'package:vedanta_lrms/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AddNewCardOneScreen extends GetWidget<AddNewCardOneController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(56.00),
                leadingWidth: 52,
                leading: AppbarImage(
                    height: getSize(32.00),
                    width: getSize(32.00),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 20, top: 12, bottom: 12),
                    onTap: onTapArrowleft20),
                title: AppbarTitle(
                    text: "lbl_add_new_card2".tr, margin: getMargin(left: 16))),
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding:
                        getPadding(left: 20, top: 15, right: 20, bottom: 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomTextFormField(
                              shadowTextfield: false,
                              width: 388,
                              focusNode: FocusNode(),
                              controller: controller.masterInputController,
                              hintText: "msg_enter_your_card".tr,
                              margin: getMargin(top: 61),
                              padding: TextFormFieldPadding.PaddingAll14,
                              textInputType: TextInputType.number,
                              validator: (value) {
                                if (!isNumeric(value)) {
                                  return "Please enter valid number";
                                }
                                return null;
                              }),
                          CustomTextFormField(
                              shadowTextfield: false,
                              width: 186,
                              focusNode: FocusNode(),
                              controller: controller.masterInputOneController,
                              hintText: "lbl_cvv".tr,
                              margin: getMargin(top: 16),
                              padding: TextFormFieldPadding.PaddingAll14,
                              alignment: Alignment.centerRight),
                          CustomTextFormField(
                              shadowTextfield: false,
                              width: 388,
                              focusNode: FocusNode(),
                              controller: controller.masterInputTwoController,
                              hintText: "msg_enter_card_holder".tr,
                              margin: getMargin(top: 16),
                              padding: TextFormFieldPadding.PaddingAll14,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          CustomButton(
                              height: 50,
                              width: 388,
                              text: "lbl_add".tr,
                              margin: getMargin(top: 32)),
                          Spacer(),
                          Container(
                              height: getVerticalSize(5.00),
                              width: getHorizontalSize(135.00),
                              decoration: BoxDecoration(
                                  color: ColorConstant.black900,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(2.00))))
                        ])))));
  }

  onTapArrowleft20() {
    Get.back();
  }
}
