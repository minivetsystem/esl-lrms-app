import 'controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/core/utils/validation_functions.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_title.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';
import 'package:vedanta_lrms/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class PaymentScreen extends GetWidget<PaymentController> {
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
                    onTap: onTapArrowleft22),
                title: AppbarTitle(
                    text: "lbl_add_new_card2".tr, margin: getMargin(left: 16))),
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding:
                        getPadding(left: 20, top: 15, right: 20, bottom: 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                              shadowTextfield: false,
                              width: 388,
                              focusNode: FocusNode(),
                              controller: controller.masterInputController,
                              hintText: "msg_enter_your_card2".tr,
                              margin: getMargin(top: 5),
                              padding: TextFormFieldPadding.PaddingAll14,
                              textInputType: TextInputType.number,
                              validator: (value) {
                                if (!isNumeric(value)) {
                                  return "Please enter valid number";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(top: 24),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomTextFormField(
                                        shadowTextfield: false,
                                        width: 186,
                                        focusNode: FocusNode(),
                                        controller:
                                            controller.masterInputOneController,
                                        hintText: "lbl_card_expiray".tr,
                                        padding:
                                            TextFormFieldPadding.PaddingAll14),
                                    CustomTextFormField(
                                        shadowTextfield: false,
                                        width: 186,
                                        focusNode: FocusNode(),
                                        controller:
                                            controller.masterInputTwoController,
                                        hintText: "lbl_cvv".tr,
                                        padding:
                                            TextFormFieldPadding.PaddingAll14,
                                        textInputAction: TextInputAction.done)
                                  ])),
                          Padding(
                              padding: getPadding(top: 24),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("lbl_total_amount".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtSFUITextRegular17Gray600
                                            .copyWith(
                                                height: getVerticalSize(1.08))),
                                    Text("lbl_458_00".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtSFUITextRegular17blueA200
                                            .copyWith(
                                                height: getVerticalSize(1.08)))
                                  ])),
                          CustomButton(
                              height: 50,
                              width: 388,
                              text: "lbl_pay".tr,
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

  onTapArrowleft22() {
    Get.back();
  }
}
