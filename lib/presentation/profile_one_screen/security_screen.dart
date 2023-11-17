import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_page.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
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
      child: ColorfulSafeArea(
          minimum: EdgeInsets.only(top: 20),
          color: ColorConstant.whiteA700,
          child: Scaffold(
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
                      onTap: () {
                        Get.back();
                      }),
                  title: AppbarSubtitle(
                      text: "Terms and Conditions",
                      margin: getMargin(left: 16)),
                  styleType: Style.bgFillblueA200),
              body: Container(
                  width: size.width,
                  padding: getPadding(left: 0, top: 10, right: 0, bottom: 48),
                  child: ListView(
                    children: [
                      Container(
                        color: ColorConstant.whiteA700,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            question('1.Types of data we collect'),
                            SizedBox(
                              height: getVerticalSize(16),
                            ),
                            answer(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                          ],
                        ).paddingSymmetric(
                            horizontal: getHorizontalSize(24), vertical: 16),
                      ),
                      Container(
                        color: ColorConstant.whiteA700,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            question('2. Use of your personal Data'),
                            SizedBox(
                              height: getVerticalSize(16),
                            ),
                            answer(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                          ],
                        ).paddingSymmetric(
                            horizontal: getHorizontalSize(24), vertical: 16),
                      ).paddingOnly(top: 10),
                      Container(
                        color: ColorConstant.whiteA700,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            question('3. Disclosure of your personal Data'),
                            SizedBox(
                              height: getVerticalSize(16),
                            ),
                            answer(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis Ac auctor augue mauris augue neque gravida. Velit ut tortor pretium viverra suspendisse. Volutpat commodo sed egestas egestas fringilla phasellus faucibus. "),
                          ],
                        ).paddingSymmetric(
                            horizontal: getHorizontalSize(24), vertical: 20),
                      ).paddingOnly(top: 10),
                    ],
                  )))),
    );
  }

  question(String s) {
    return Text(
      s,
      style: AppStyle.txtSFUITextBold17Width700black.copyWith(
        height: getVerticalSize(
          1.5,
        ),
      ),
    );
  }

  answer(String s) {
    return Text(
      s,
      style: AppStyle.txtSFUIText14.copyWith(
        height: getVerticalSize(
          1.5,
        ),
      ),
    );
  }
}
