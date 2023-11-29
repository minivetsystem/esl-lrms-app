import 'package:colorful_safe_area/colorful_safe_area.dart';

import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/custom_page.dart';
import '../select_payment_method_one_dialog/controller/select_payment_method_one_controller.dart';
import '../select_payment_method_one_dialog/select_payment_method_one_dialog.dart';
import 'controller/select_payment_method_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';
import 'package:vedanta_lrms/widgets/custom_radio_button.dart';

import 'models/select_payment_method_model.dart';

// ignore: must_be_immutable
class SelectPaymentMethodScreen
    extends GetWidget<SelectPaymentMethodController> {
  List<SelectPaymentMethodModel> data = SelectPaymentMethodController.getData();
  SelectPaymentMethodController controller =
      Get.put(SelectPaymentMethodController());

  @override
  Widget build(BuildContext context) {
    return CustomPage(widget: get_page(context));
  }

// ignore: non_constant_identifier_names
  Widget get_page(context) {
    return ColorfulSafeArea(
        minimum: EdgeInsets.only(top: 20),
        color: ColorConstant.whiteA700,
        child: GetBuilder<SelectPaymentMethodController>(
          init: SelectPaymentMethodController(),
          builder: (controller) => Scaffold(
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
                      onTap: onTapArrowleft9),
                  title: AppbarSubtitle(
                      text: "msg_select_payment_method".tr,
                      margin: getMargin(left: 16)),
                  styleType: Style.bgFillblueA200),
              body: Column(
                children: [
                  Padding(
                    padding: getPadding(top: 10),
                    child: Container(
                      color: ColorConstant.whiteA700,
                      child: GetBuilder<SelectPaymentMethodController>(
                        init: SelectPaymentMethodController(),
                        builder: (controller) => ListView.builder(
                          padding: getPadding(top: 8, bottom: 8),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            SelectPaymentMethodModel paymentData = data[index];
                            return Padding(
                              padding: getPadding(
                                  top: 8, bottom: 8, left: 20, right: 20),
                              child: Container(
                                  padding: getPadding(
                                      left: 0, top: 0, right: 16, bottom: 0),
                                  decoration:
                                      AppDecoration.paymentOptionFormate,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getPadding(bottom: 0),
                                            child: CustomRadioButton(
                                                text: paymentData.title,
                                                iconSize: 24,
                                                value: paymentData.title,
                                                groupValue:
                                                    controller.radioGroup.value,
                                                onChange: (value) {
                                                  controller.setValue(value);
                                                })),
                                        CustomImageView(
                                          svgPath: paymentData.icon,
                                          height: getVerticalSize(31.00),
                                          width: getHorizontalSize(52.00),
                                        )
                                      ])),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: getPadding(left: 20, right: 20),
                    child: CustomButton(
                        onTap: () {
                          Get.toNamed(AppRoutes.addNewCardScreen);
                        },
                        height: 40,
                        width: 388,
                        text: "lbl_add_new_card".tr,
                        variant: ButtonVariant.OutlineblueA200_1,
                        fontStyle: ButtonFontStyle.SFUITextBold14),
                  ),
                  Padding(
                    padding:
                        getPadding(top: 30, bottom: 32, left: 20, right: 20),
                    child: CustomButton(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(22))),
                                insetPadding:
                                    EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  width: double.infinity,
                                  child: SelectPaymentMethodOneDialog(Get.put(
                                      SelectPaymentMethodOneController())),
                                ),
                              );
                            },
                          );
                        },
                        height: 50,
                        width: 388,
                        text: "lbl_confirm_booking".tr),
                  ),
                ],
              )),
        ));
  }

  onTapArrowleft9() {
    Get.back();
  }
}
