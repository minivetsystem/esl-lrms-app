import '../../widgets/custom_page.dart';
import 'controller/truck_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/widgets/custom_button.dart';
import 'package:truck_booking_app/widgets/custom_icon_button.dart';

class TruckDetailScreen extends GetWidget<TruckDetailController> {
  @override
  Widget build(BuildContext context) {
    return CustomPage(widget: get_page());
  }

  // ignore: non_constant_identifier_names
  Widget get_page() {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorConstant.lightGray,
        body: Container(
          width: size.width,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Stack(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.img3delectrictruckstreet276x428,
                    height: getVerticalSize(
                      320.00,
                    ),
                    width: getHorizontalSize(
                      428.00,
                    ),
                    alignment: Alignment.topCenter,
                  ),
                  Container(
                    margin: getMargin(
                      top: 292,
                      left: 16,
                      right: 16,
                    ),
                    padding: getPadding(
                      left: 16,
                      top: 13,
                      right: 16,
                      bottom: 13,
                    ),
                    decoration: AppDecoration.outlineBlack90016.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 2,
                          ),
                          child: Text(
                            "lbl_info".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFUITextBold17Width700black
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                ),
                                child: Text(
                                  "msg_loading_capacity".tr,
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
                                  bottom: 1,
                                ),
                                child: Text(
                                  "lbl_1000kg".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFUITextBold17Width700black
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
                        Padding(
                          padding: getPadding(
                            top: 17,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "lbl_type".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFUITextRegular17.copyWith(
                                  height: getVerticalSize(
                                    1.08,
                                  ),
                                ),
                              ),
                              Text(
                                "lbl_heavy_duty".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFUITextBold17Width700black
                                    .copyWith(
                                  height: getVerticalSize(
                                    1.08,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: getPadding(
                                  bottom: 1,
                                ),
                                child: Text(
                                  "lbl_size".tr,
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
                                  top: 1,
                                ),
                                child: Text(
                                  "lbl_large".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFUITextBold17Width700black
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
                        Padding(
                          padding: getPadding(
                            top: 14,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "lbl_price".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFUITextRegular17.copyWith(
                                  height: getVerticalSize(
                                    1.08,
                                  ),
                                ),
                              ),
                              Text(
                                "lbl_549_00".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFUITextBold17Width700black
                                    .copyWith(
                                  height: getVerticalSize(
                                    1.08,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: getHorizontalSize(
                            356.00,
                          ),
                          margin: getMargin(
                            top: 24,
                          ),
                          padding: getPadding(
                            all: 0,
                          ),
                          decoration: AppDecoration.outlineGray300.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder4,
                          ),
                          child: Padding(
                            padding: getPadding(
                                left: 8, right: 8, top: 8, bottom: 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.imgEllipse8,
                                          height: getSize(
                                            40.00,
                                          ),
                                          width: getSize(
                                            40.00,
                                          ),
                                          radius: BorderRadius.circular(
                                            getHorizontalSize(
                                              20.00,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 0,
                                            top: 11,
                                            bottom: 10,
                                          ),
                                          child: Text(
                                            "lbl_jane_cooper".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSFUITextRegular15Black900
                                                .copyWith(
                                              height: getVerticalSize(
                                                1.12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomIconButton(
                                          height: 40,
                                          width: 40,
                                          shape: IconButtonShape.CircleBorder20,
                                          child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgCallWhiteA700,
                                          ),
                                        ),
                                        CustomIconButton(
                                          onTap: () {
                                            Get.toNamed(
                                                AppRoutes.truckDetailTwoScreen);
                                          },
                                          height: 40,
                                          width: 40,
                                          margin: getMargin(
                                            left: 0,
                                          ),
                                          shape: IconButtonShape.CircleBorder20,
                                          child: CustomImageView(
                                            svgPath: ImageConstant.imgMobile,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 17,
                                  ),
                                  child: Text(
                                    "lbl_vehicle_plat".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtSFUITextSemibold15.copyWith(
                                      height: getVerticalSize(
                                        1.5,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 7,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    "lbl_rjgj6592".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtSFUITextRegular15.copyWith(
                                      height: getVerticalSize(
                                        1.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 17,
                          ),
                          child: Text(
                            "lbl_despition".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFUITextBold17Width700black
                                .copyWith(
                              height: getVerticalSize(
                                1.5,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: getHorizontalSize(
                            324.00,
                          ),
                          margin: getMargin(
                            top: 7,
                          ),
                          child: Text(
                            "msg_lorem_ipsum_dolor7".tr,
                            maxLines: null,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFUITextRegular17.copyWith(
                              height: getVerticalSize(
                                1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.selectPaymentMethodScreen);
                },
                margin: getMargin(bottom: 24, top: 44, left: 20, right: 20),
                height: 50,
                width: 388,
                text: "lbl_book_now".tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
