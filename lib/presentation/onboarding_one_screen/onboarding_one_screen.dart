import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_page.dart';
import 'controller/onboarding_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';

import 'models/onboarding_data.dart';
import 'models/onboarding_one_model.dart';

// ignore: must_be_immutable
class OnboardingOneScreen extends GetWidget<OnboardingOneController> {
  OnboardingOneController onboardingOneController =
      Get.put(OnboardingOneController());
  PageController pageController = PageController();
  List<OnboardingOneModel> sliderData = OnboardingData.getOnboardingPage();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return CustomPage(widget: get_page());
  }

  // ignore: non_constant_identifier_names
  Widget get_page() {
    return Scaffold(
      body: GetBuilder<OnboardingOneController>(
        init: OnboardingOneController(),
        builder: (onboardingOneController) => Container(
          child: Stack(
            children: [
              PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  onboardingOneController.onSetPageIndex(value);
                  // onboardingOneController.setidicaterIndex(value);
                },
                controller: pageController,
                itemCount: sliderData.length,
                itemBuilder: (context, index) {
                  OnboardingOneModel slider = sliderData[index];
                  return Column(
                    children: [
                      Container(
                        child: CustomImageView(
                          imagePath: slider.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: kIsWeb ? 559.h : 589.h),
                child: Container(
                  width: kIsWeb ? 428.h : double.infinity,
                  decoration: AppDecoration.fillWhiteA700.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL40,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            sliderData[onboardingOneController.currentPage]
                                .title!,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFUITextBold27.copyWith(
                              height: 1.02.h,
                            ),
                          ),
                          Container(
                            width: 330.h,
                            margin: EdgeInsets.only(
                              top: 16.h,
                            ),
                            child: Text(
                              sliderData[onboardingOneController.currentPage]
                                  .subTitle!,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtSFUITextRegular17.copyWith(
                                height: 1.5.h,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 56.h),
                            child: SizedBox(
                              height: 8.h,
                              width: kIsWeb ? 60.h : 60.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: sliderData.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.only(left: 2.h, right: 2.h),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      height: getVerticalSize(
                                          onboardingOneController.currentPage ==
                                                  index
                                              ? 5.00
                                              : 8.00),
                                      width: getHorizontalSize(
                                          onboardingOneController.currentPage ==
                                                  index
                                              ? 24
                                              : 8.00),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.h)),
                                          color: onboardingOneController
                                                      .currentPage ==
                                                  index
                                              ? ColorConstant.blue
                                              : ColorConstant.lightblue),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 48.h, right: 20.h, left: 20.h),
                            child: onboardingOneController.currentPage ==
                                    sliderData.length - 1
                                ? CustomButton(
                                    height: 50.h,
                                    width: 388.h,
                                    text: "lbl_get_started".tr,
                                    margin: EdgeInsets.only(
                                      top: 0.h,
                                    ),
                                    onTap: () {
                                      PrefUtils.setIsIntro(false);
                                      Get.toNamed(
                                          AppRoutes.loginScreenOneScreen);
                                    },
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          onTap: () {
                                            PrefUtils.setIsIntro(false);
                                            Get.toNamed(
                                                AppRoutes.loginScreenOneScreen);
                                          },
                                          height: 50.h,
                                          text: "lbl_skip".tr,
                                          variant:
                                              ButtonVariant.OutlineblueA200,
                                          fontStyle:
                                              ButtonFontStyle.SFUITextBold18,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16.h,
                                      ),
                                      Expanded(
                                        child: CustomButton(
                                          onTap: () {
                                            pageController.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 100),
                                                curve: Curves.bounceIn);
                                          },
                                          height: 50,
                                          text: "lbl_continue".tr,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Scaffold(
    //   body: GetBuilder<OnboardingOneController>(
    //     init: OnboardingOneController(),
    //     builder: (onboardingOneController) => Container(
    //       child: Stack(
    //         children: [
    //           PageView.builder(
    //             scrollDirection: Axis.horizontal,
    //             onPageChanged: (value) {
    //               onboardingOneController.onSetPageIndex(value);
    //               // onboardingOneController.setidicaterIndex(value);
    //             },
    //             controller: pageController,
    //             itemCount: sliderData.length,
    //             itemBuilder: (context, index) {
    //               OnboardingOneModel slider = sliderData[index];
    //               return Column(
    //                 children: [
    //                   Container(
    //                     child: CustomImageView(
    //                       imagePath: slider.image,
    //
    //                       fit: BoxFit.fill,
    //                     ),
    //                   ),
    //                 ],
    //               );
    //             },
    //           ),
    //           Padding(
    //             padding: getPadding(top: kIsWeb?559:589),
    //             child: Container(
    //               width: kIsWeb? 428:double.infinity,
    //               decoration: AppDecoration.fillWhiteA700.copyWith(
    //                 borderRadius: BorderRadiusStyle.customBorderTL40,
    //               ),
    //               child: Padding(
    //                 padding: getPadding(top: 40),
    //                 child: Center(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       Text(
    //                         sliderData[onboardingOneController.currentPage]
    //                             .title!,
    //                         overflow: TextOverflow.ellipsis,
    //                         textAlign: TextAlign.left,
    //                         style: AppStyle.txtSFUITextBold27.copyWith(
    //                           height: getVerticalSize(
    //                             1.02,
    //                           ),
    //                         ),
    //                       ),
    //                       Container(
    //                         width: getHorizontalSize(
    //                           330.00,
    //                         ),
    //                         margin: getMargin(
    //                           top: 16,
    //                         ),
    //                         child: Text(
    //                           sliderData[onboardingOneController.currentPage]
    //                               .subTitle!,
    //                           maxLines: null,
    //                           textAlign: TextAlign.center,
    //                           style: AppStyle.txtSFUITextRegular17.copyWith(
    //                             height: getVerticalSize(
    //                               1.5,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       Padding(
    //                         padding: getPadding(top: 56),
    //                         child: SizedBox(
    //                           height: getVerticalSize(8.00),
    //                           width: getVerticalSize(kIsWeb?110:60),
    //                           child: ListView.builder(
    //                             scrollDirection: Axis.horizontal,
    //                             itemCount: sliderData.length,
    //                             itemBuilder: (context, index) {
    //                               return Padding(
    //                                 padding: getPadding(left: 2, right: 2),
    //                                 child: AnimatedContainer(
    //                                   duration: Duration(milliseconds: 300),
    //                                   height: getVerticalSize(onboardingOneController.currentPage ==
    //                                       index
    //                                       ?5.00:8.00),
    //                                   width: getHorizontalSize(
    //                                       onboardingOneController.currentPage ==
    //                                           index
    //                                           ? 24
    //                                           : 8.00),
    //                                   decoration: BoxDecoration(
    //                                       borderRadius: BorderRadius.all(
    //                                           Radius.circular(20)),
    //                                       color: onboardingOneController
    //                                           .currentPage ==
    //                                           index
    //                                           ? ColorConstant.blue
    //                                           : ColorConstant.lightblue),
    //                                 ),
    //                               );
    //                             },
    //                           ),
    //                         ),
    //                       ),
    //                       Padding(
    //                         padding: getPadding(
    //                             top: 48,
    //                             right: 20,left: 20
    //                         ),
    //                         child: onboardingOneController.currentPage==sliderData.length-1? CustomButton(
    //                           height: 50,
    //                           width: 388,
    //                           text: "lbl_get_started".tr,
    //                           margin: getMargin(
    //                             top: 0,
    //                           ),
    //                           onTap: () {
    //                             PrefUtils.setIsIntro(false);
    //                             Get.toNamed(AppRoutes.loginScreenOneScreen);
    //                           },
    //                         ):Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Expanded(
    //                               child: CustomButton(
    //                                 onTap: () {
    //                                   PrefUtils.setIsIntro(false);
    //                                   Get.toNamed(AppRoutes.loginScreenOneScreen);
    //                                 },
    //                                 height: 50,
    //                                 text: "lbl_skip".tr,
    //                                 variant: ButtonVariant.OutlineblueA200,
    //                                 fontStyle: ButtonFontStyle.SFUITextBold18,
    //                               ),
    //                             ),
    //                             SizedBox(width: getHorizontalSize(16),),
    //                             Expanded(
    //                               child: CustomButton(
    //                                 onTap: () {
    //                                   pageController.nextPage(
    //                                       duration: const Duration(milliseconds: 100),
    //                                       curve: Curves.bounceIn);
    //                                 },
    //
    //                                 height: 50,
    //
    //                                 text: "lbl_continue".tr,
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //
    //
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
