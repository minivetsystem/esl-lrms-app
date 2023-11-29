import '../home_screen_main/home_main_screen.dart';
import 'controller/home_five_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/history_page/history_page.dart';
import 'package:vedanta_lrms/presentation/notification_empty_page/notification_empty_page.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_circleimage.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_bottom_bar.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';
import 'package:vedanta_lrms/widgets/custom_drop_down.dart';
import 'package:vedanta_lrms/widgets/custom_icon_button.dart';
import 'package:vedanta_lrms/widgets/custom_text_form_field.dart';

class HomeFiveScreen extends GetWidget<HomeFiveController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteA700,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              height: getVerticalSize(
                797.00,
              ),
              width: size.width,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: getPadding(
                        left: 20,
                        top: 22,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_wel_come".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFUITextBold27WhiteA700.copyWith(
                              height: getVerticalSize(
                                1.02,
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 2,
                            ),
                            child: Text(
                              "lbl_lorem_ipsum".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSFUITextRegular17WhiteA700
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
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: getVerticalSize(
                        755.00,
                      ),
                      width: size.width,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgImage1,
                            height: getVerticalSize(
                              755.00,
                            ),
                            width: getHorizontalSize(
                              428.00,
                            ),
                            alignment: Alignment.center,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: getPadding(
                                left: 20,
                                right: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomTextFormField(
                                    shadowTextfield: false,
                                    width: 388,
                                    focusNode: FocusNode(),
                                    controller: controller.group268Controller,
                                    hintText: "msg_1901_thornridge".tr,
                                    variant:
                                        TextFormFieldVariant.OutlineBlack90016,
                                    shape: TextFormFieldShape.RoundedBorder10,
                                    padding: TextFormFieldPadding.PaddingT14_1,
                                    fontStyle: TextFormFieldFontStyle
                                        .SFUITextRegular17,
                                    textInputAction: TextInputAction.done,
                                    prefix: Container(
                                      margin: getMargin(
                                        left: 16,
                                        top: 12,
                                        right: 8,
                                        bottom: 12,
                                      ),
                                      child: CustomImageView(
                                        svgPath: ImageConstant.imgContrast,
                                      ),
                                    ),
                                    prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(
                                        48.00,
                                      ),
                                    ),
                                    suffix: Container(
                                      margin: getMargin(
                                        left: 30,
                                        top: 12,
                                        right: 16,
                                        bottom: 12,
                                      ),
                                      child: CustomImageView(
                                        svgPath: ImageConstant.imgClose,
                                      ),
                                    ),
                                    suffixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(
                                        48.00,
                                      ),
                                    ),
                                  ),
                                  CustomImageView(
                                    svgPath: ImageConstant.imgLocation,
                                    height: getSize(
                                      47.00,
                                    ),
                                    width: getSize(
                                      47.00,
                                    ),
                                    margin: getMargin(
                                      top: 277,
                                      right: 128,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 7,
                                      right: 109,
                                    ),
                                    child: Text(
                                      "lbl_thornridge".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFUITextSemibold15
                                          .copyWith(
                                        height: getVerticalSize(
                                          1.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: getVerticalSize(
                                      264.00,
                                    ),
                                    width: getHorizontalSize(
                                      388.00,
                                    ),
                                    margin: getMargin(
                                      top: 11,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CustomIconButton(
                                          height: 40,
                                          width: 40,
                                          margin: getMargin(
                                            right: 8,
                                            bottom: 9,
                                          ),
                                          alignment: Alignment.bottomRight,
                                          child: CustomImageView(
                                            svgPath: ImageConstant.imgFrame30,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            padding: getPadding(
                                              left: 15,
                                              top: 16,
                                              right: 15,
                                              bottom: 16,
                                            ),
                                            decoration: AppDecoration
                                                .outlineBlack90016
                                                .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder10,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: getPadding(
                                                    top: 8,
                                                  ),
                                                  child: Text(
                                                    "msg_select_date_time".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtSFUITextBold17
                                                        .copyWith(
                                                      height: getVerticalSize(
                                                        1.08,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                CustomDropDown(
                                                  width: 356,
                                                  focusNode: FocusNode(),
                                                  icon: Container(
                                                    margin: getMargin(
                                                      left: 30,
                                                      right: 16,
                                                    ),
                                                    child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgArrowdownGray600,
                                                    ),
                                                  ),
                                                  hintText:
                                                      "lbl_select_date".tr,
                                                  margin: getMargin(
                                                    top: 16,
                                                  ),
                                                  padding: DropDownPadding
                                                      .PaddingT14,
                                                  items: controller
                                                      .homeFiveModelObj
                                                      .value
                                                      .dropdownItemList,
                                                  prefix: Container(
                                                    margin: getMargin(
                                                      left: 16,
                                                      top: 12,
                                                      right: 8,
                                                      bottom: 12,
                                                    ),
                                                    child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgCalendar,
                                                    ),
                                                  ),
                                                  prefixConstraints:
                                                      BoxConstraints(
                                                    maxHeight: getVerticalSize(
                                                      48.00,
                                                    ),
                                                  ),
                                                  onChanged: (value) {
                                                    controller
                                                        .onSelected(value);
                                                  },
                                                ),
                                                CustomDropDown(
                                                  width: 356,
                                                  focusNode: FocusNode(),
                                                  icon: Container(
                                                    margin: getMargin(
                                                      left: 30,
                                                      right: 16,
                                                    ),
                                                    child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgArrowdownGray600,
                                                    ),
                                                  ),
                                                  hintText:
                                                      "lbl_select_time".tr,
                                                  margin: getMargin(
                                                    top: 16,
                                                  ),
                                                  padding: DropDownPadding
                                                      .PaddingT14,
                                                  items: controller
                                                      .homeFiveModelObj
                                                      .value
                                                      .dropdownItemList1,
                                                  prefix: Container(
                                                    margin: getMargin(
                                                      left: 16,
                                                      top: 12,
                                                      right: 8,
                                                      bottom: 12,
                                                    ),
                                                    child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgClock,
                                                    ),
                                                  ),
                                                  prefixConstraints:
                                                      BoxConstraints(
                                                    maxHeight: getVerticalSize(
                                                      48.00,
                                                    ),
                                                  ),
                                                  onChanged: (value) {
                                                    controller
                                                        .onSelected1(value);
                                                  },
                                                ),
                                                CustomButton(
                                                  height: 50,
                                                  width: 356,
                                                  text: "lbl_find_truck".tr,
                                                  margin: getMargin(
                                                    top: 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
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
                  CustomAppBar(
                    height: getVerticalSize(
                      70.00,
                    ),
                    title: Padding(
                      padding: getPadding(
                        left: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppbarSubtitle(
                            text: "lbl_welcome2".tr,
                          ),
                          AppbarSubtitle1(
                            text: "lbl_jerome_bell".tr,
                            margin: getMargin(
                              top: 1,
                              right: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      AppbarCircleimage(
                        imagePath: ImageConstant.imgEllipse3,
                        margin: getMargin(
                          left: 20,
                          top: 11,
                          right: 20,
                          bottom: 19,
                        ),
                      ),
                    ],
                    styleType: Style.bgFillblueA200,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Get.toNamed(getCurrentRoute(type), id: 1);
          },
        ),
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Contrastwhitea700:
        return AppRoutes.HomeMainScreen;
      case BottomBarEnum.Sort:
        return AppRoutes.historyPage;
          case BottomBarEnum.Globe:
        return AppRoutes.mapScreen;
      case BottomBarEnum.Notification:
        return AppRoutes.notificationEmptyPage;
      case BottomBarEnum.Usergray400:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.HomeMainScreen:
        return HomeMainScreen();
      case AppRoutes.historyPage:
        return HistoryPage();
      case AppRoutes.notificationEmptyPage:
        return NotificationEmptyPage();
      default:
        return DefaultWidget();
    }
  }
}
