import '../../widgets/custom_page.dart';
import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return CustomPage(widget: get_page());
  }

  // ignore: non_constant_identifier_names
  Widget get_page() {
    return Scaffold(
        backgroundColor: ColorConstant.blueA200,
        body: SafeArea(
          child: Container(
              width: size.width,
              padding: getPadding(top: 15, bottom: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(ImageConstant.imgSplashLogo)
                    // CustomImageView(
                    //   svgPath: ImageConstant.imgSplashLogo,
                    //   height: getVerticalSize(232.00),
                    //   width: getHorizontalSize(176.00),
                    // ),
                  ])),
        ));
  }
}
