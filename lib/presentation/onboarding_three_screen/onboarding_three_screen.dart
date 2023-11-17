import 'controller/onboarding_three_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/widgets/custom_button.dart';

class OnboardingThreeScreen extends GetWidget<OnboardingThreeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          height: getVerticalSize(
            882.00,
          ),
          width: size.width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgProfessionaltr,
                height: getVerticalSize(
                  560.00,
                ),
                width: getHorizontalSize(
                  428.00,
                ),
                alignment: Alignment.topCenter,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: size.width,
                  padding: getPadding(
                    left: 20,
                    top: 15,
                    right: 20,
                    bottom: 15,
                  ),
                  decoration: AppDecoration.fillWhiteA700.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL40,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 27,
                        ),
                        child: Text(
                          "msg_real_time_tracking".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSFUITextBold27.copyWith(
                            height: getVerticalSize(
                              1.02,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          366.00,
                        ),
                        margin: getMargin(
                          top: 14,
                        ),
                        child: Text(
                          "msg_morbi_convallis".tr,
                          maxLines: null,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtSFUITextRegular17.copyWith(
                            height: getVerticalSize(
                              1.08,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: getVerticalSize(
                          8.00,
                        ),
                        margin: getMargin(
                          top: 53,
                        ),
                        child: SmoothIndicator(
                          offset: 0,
                          count: 3,
                          axisDirection: Axis.horizontal,
                          effect: ScrollingDotsEffect(
                            spacing: 4,
                            activeDotColor: ColorConstant.blueA200,
                            dotColor: ColorConstant.lime100,
                            dotHeight: getVerticalSize(
                              8.00,
                            ),
                            dotWidth: getHorizontalSize(
                              8.00,
                            ),
                          ),
                        ),
                      ),
                      CustomButton(
                        height: 50,
                        width: 388,
                        text: "lbl_get_started".tr,
                        margin: getMargin(
                          top: 48,
                        ),
                      ),
                      Container(
                        height: getVerticalSize(
                          5.00,
                        ),
                        width: getHorizontalSize(
                          135.00,
                        ),
                        margin: getMargin(
                          top: 38,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.black900,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              2.00,
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
      ),
    );
  }
}
