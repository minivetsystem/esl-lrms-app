import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../theme/app_style.dart';
import '../widgets/app_bar/appbar_image.dart';
import '../widgets/app_bar/appbar_subtitle.dart';
import '../widgets/app_bar/custom_app_bar.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: ColorfulSafeArea(
          color: ColorConstant.whiteA700,
          child: Scaffold(
              backgroundColor: ColorConstant.lightGray,
              appBar: CustomAppBar(
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
                  centerTitle: true,
                  title: AppbarSubtitle(text: "lbl_support".tr),
                  styleType: Style.bgFillblueA200),
              body: Container(
                  width: size.width,
                  padding: getPadding(left: 0, top: 24, right: 0, bottom: 48),
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
                            horizontal: getHorizontalSize(24), vertical: 20),
                      ).paddingSymmetric(vertical: getVerticalSize(10)),
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
                            horizontal: getHorizontalSize(24), vertical: 20),
                      ).paddingSymmetric(vertical: getVerticalSize(10)),
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
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                          ],
                        ).paddingSymmetric(
                            horizontal: getHorizontalSize(24), vertical: 20),
                      ).paddingSymmetric(vertical: getVerticalSize(10)),
                    ],
                  )))),
    );
  }

  question(String s) {
    return Text(
      s,
      style: AppStyle.txtSFUITextBold17Width700black.copyWith(
        height: getVerticalSize(
          1.3,
        ),
      ),
    );
  }

  answer(String s) {
    return Text(
      s,
      style: AppStyle.txtSFUIText14.copyWith(
        height: getVerticalSize(
          1.3,
        ),
      ),
    );
  }
}
