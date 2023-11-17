import '../home_screen_main/home_main_screen.dart';
import 'controller/home_screen_three_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/presentation/history_page/history_page.dart';
import 'package:truck_booking_app/presentation/notification_empty_page/notification_empty_page.dart';
import 'package:truck_booking_app/widgets/custom_bottom_bar.dart';
import 'package:truck_booking_app/widgets/custom_button.dart';
import 'package:truck_booking_app/widgets/custom_drop_down.dart';
import 'package:truck_booking_app/widgets/custom_icon_button.dart';
import 'package:truck_booking_app/widgets/custom_text_form_field.dart';

class HomeScreenThreeScreen extends GetWidget<HomeScreenThreeController> {
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
              width: size.width,
              margin: getMargin(
                bottom: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: getVerticalSize(
                      882.00,
                    ),
                    width: size.width,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: size.width,
                            margin: getMargin(
                              bottom: 779,
                            ),
                            padding: getPadding(
                              left: 20,
                              top: 23,
                              right: 20,
                              bottom: 23,
                            ),
                            decoration: AppDecoration.fillblueA200.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderBL30,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "lbl_wel_come".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFUITextBold27WhiteA700
                                          .copyWith(
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
                                        style: AppStyle
                                            .txtSFUITextRegular17WhiteA700
                                            .copyWith(
                                          height: getVerticalSize(
                                            1.08,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgEllipse3,
                                  height: getSize(
                                    48.00,
                                  ),
                                  width: getSize(
                                    48.00,
                                  ),
                                  radius: BorderRadius.circular(
                                    getHorizontalSize(
                                      24.00,
                                    ),
                                  ),
                                  margin: getMargin(
                                    top: 5,
                                    bottom: 4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: getPadding(
                              left: 20,
                              right: 20,
                              bottom: 2,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: getMargin(
                                      left: 39,
                                      right: 40,
                                    ),
                                    padding: getPadding(
                                      all: 4,
                                    ),
                                    decoration:
                                        AppDecoration.outlineGray400.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder10,
                                    ),
                                    child: Row(
                                      children: [
                                        CustomButton(
                                          height: 40,
                                          width: 143,
                                          text: "lbl_one_way".tr,
                                          variant: ButtonVariant.FillLime100,
                                          shape: ButtonShape.RoundedBorder10,
                                          padding: ButtonPadding.PaddingAll9,
                                          fontStyle:
                                              ButtonFontStyle.SFUITextBold17,
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 34,
                                            top: 10,
                                            right: 36,
                                            bottom: 8,
                                          ),
                                          child: Text(
                                            "lbl_round_trip".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSFUITextRegular17Gray600
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
                                Padding(
                                  padding: getPadding(
                                    top: 32,
                                  ),
                                  child: Text(
                                    "lbl_choose_location".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextBold17.copyWith(
                                      height: getVerticalSize(
                                        1.08,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 4,
                                    top: 16,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomTextFormField(
                                            shadowTextfield: false,
                                            width: 308,
                                            focusNode: FocusNode(),
                                            controller: controller
                                                .masterInputController,
                                            hintText: "lbl_from".tr,
                                            textInputAction:
                                                TextInputAction.done,
                                            prefix: Container(
                                              margin: getMargin(
                                                left: 16,
                                                top: 12,
                                                right: 8,
                                                bottom: 12,
                                              ),
                                              child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgLocationBlack900,
                                              ),
                                            ),
                                            prefixConstraints: BoxConstraints(
                                              maxHeight: getVerticalSize(
                                                48.00,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: getMargin(
                                              top: 24,
                                            ),
                                            padding: getPadding(
                                              left: 16,
                                              top: 12,
                                              right: 16,
                                              bottom: 12,
                                            ),
                                            decoration: AppDecoration
                                                .fillGray100
                                                .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder4,
                                            ),
                                            child: Row(
                                              children: [
                                                CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgSignal,
                                                  height: getSize(
                                                    24.00,
                                                  ),
                                                  width: getSize(
                                                    24.00,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                    left: 8,
                                                    top: 2,
                                                    right: 226,
                                                    bottom: 3,
                                                  ),
                                                  child: Text(
                                                    "lbl_to".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtSFUITextRegular15
                                                        .copyWith(
                                                      height: getVerticalSize(
                                                        1.12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      CustomIconButton(
                                        height: 64,
                                        width: 64,
                                        margin: getMargin(
                                          top: 28,
                                          bottom: 28,
                                        ),
                                        variant: IconButtonVariant.FillLime100,
                                        shape: IconButtonShape.CircleBorder32,
                                        padding: IconButtonPadding.PaddingAll19,
                                        child: CustomImageView(
                                          svgPath:
                                              ImageConstant.imgSortblueA200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 24,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: getPadding(
                                          top: 1,
                                        ),
                                        child: Text(
                                          "lbl_departure".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSFUITextBold17
                                              .copyWith(
                                            height: getVerticalSize(
                                              1.08,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          left: 115,
                                          bottom: 1,
                                        ),
                                        child: Text(
                                          "lbl_return".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSFUITextBold17
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomDropDown(
                                        width: 186,
                                        focusNode: FocusNode(),
                                        icon: Container(
                                          margin: getMargin(
                                            left: 24,
                                            right: 16,
                                          ),
                                          child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowdownGray600,
                                          ),
                                        ),
                                        hintText: "lbl_select_date".tr,
                                        padding: DropDownPadding.PaddingT14,
                                        items: controller
                                            .homeScreenThreeModelObj
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
                                            svgPath: ImageConstant.imgCalendar,
                                          ),
                                        ),
                                        prefixConstraints: BoxConstraints(
                                          maxHeight: getVerticalSize(
                                            48.00,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          controller.onSelected(value);
                                        },
                                      ),
                                      CustomDropDown(
                                        width: 186,
                                        focusNode: FocusNode(),
                                        icon: Container(
                                          margin: getMargin(
                                            left: 24,
                                            right: 16,
                                          ),
                                          child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowdownGray600,
                                          ),
                                        ),
                                        hintText: "lbl_select_date".tr,
                                        padding: DropDownPadding.PaddingT14,
                                        items: controller
                                            .homeScreenThreeModelObj
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
                                            svgPath: ImageConstant.imgCalendar,
                                          ),
                                        ),
                                        prefixConstraints: BoxConstraints(
                                          maxHeight: getVerticalSize(
                                            48.00,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          controller.onSelected1(value);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 24,
                                    right: 139,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "lbl_adult_s".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtSFUITextBold17.copyWith(
                                          height: getVerticalSize(
                                            1.08,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "lbl_class".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtSFUITextBold17.copyWith(
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
                                    top: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      CustomIconButton(
                                        height: 48,
                                        width: 48,
                                        variant: IconButtonVariant.FillGray100,
                                        padding: IconButtonPadding.PaddingAll6,
                                        child: CustomImageView(
                                          svgPath: ImageConstant.imgMenu,
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          left: 16,
                                          top: 13,
                                          bottom: 13,
                                        ),
                                        child: Text(
                                          "lbl_01".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSFUITextRegular17
                                              .copyWith(
                                            height: getVerticalSize(
                                              1.08,
                                            ),
                                          ),
                                        ),
                                      ),
                                      CustomIconButton(
                                        height: 48,
                                        width: 48,
                                        margin: getMargin(
                                          left: 17,
                                        ),
                                        variant: IconButtonVariant.FillGray100,
                                        padding: IconButtonPadding.PaddingAll6,
                                        child: CustomImageView(
                                          svgPath:
                                              ImageConstant.imgPlusBlack900,
                                        ),
                                      ),
                                      Spacer(),
                                      CustomDropDown(
                                        width: 186,
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
                                        hintText: "lbl_select_class".tr,
                                        items: controller
                                            .homeScreenThreeModelObj
                                            .value
                                            .dropdownItemList2,
                                        onChanged: (value) {
                                          controller.onSelected2(value);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                CustomButton(
                                  height: 50,
                                  width: 388,
                                  text: "lbl_search2".tr,
                                  margin: getMargin(
                                    top: 32,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 24,
                                  ),
                                  child: Text(
                                    "lbl_recent_search".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextBold17.copyWith(
                                      height: getVerticalSize(
                                        1.08,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 16,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: getPadding(
                                          top: 4,
                                          bottom: 1,
                                        ),
                                        child: Text(
                                          "msg_from_lorem_to_ipsum".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSFUITextRegular15
                                              .copyWith(
                                            height: getVerticalSize(
                                              1.12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      CustomImageView(
                                        svgPath: ImageConstant.imgClose,
                                        height: getSize(
                                          24.00,
                                        ),
                                        width: getSize(
                                          24.00,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 16,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: getPadding(
                                          top: 4,
                                          bottom: 1,
                                        ),
                                        child: Text(
                                          "msg_from_lorem_to_ipsum".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSFUITextRegular15
                                              .copyWith(
                                            height: getVerticalSize(
                                              1.12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      CustomImageView(
                                        svgPath: ImageConstant.imgClose,
                                        height: getSize(
                                          24.00,
                                        ),
                                        width: getSize(
                                          24.00,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 16,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: getPadding(
                                          top: 4,
                                          bottom: 1,
                                        ),
                                        child: Text(
                                          "msg_from_lorem_to_ipsum".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSFUITextRegular15
                                              .copyWith(
                                            height: getVerticalSize(
                                              1.12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      CustomImageView(
                                        svgPath: ImageConstant.imgClose,
                                        height: getSize(
                                          24.00,
                                        ),
                                        width: getSize(
                                          24.00,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 25,
                                  ),
                                  child: Text(
                                    "lbl_special_offer".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextBold17.copyWith(
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
                          alignment: Alignment.center,
                          child: Container(
                            width: size.width,
                            padding: getPadding(
                              left: 151,
                              top: 409,
                              right: 151,
                              bottom: 409,
                            ),
                            decoration: AppDecoration.fillBlack9007f,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    top: 42,
                                  ),
                                  child: Text(
                                    "lbl_17".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtSFUITextRegular17WhiteA700
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
                      ],
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      388.00,
                    ),
                    margin: getMargin(
                      left: 20,
                      top: 13,
                      right: 20,
                    ),
                    decoration: AppDecoration.fillBlack900.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder4,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.img67732931,
                          height: getVerticalSize(
                            140.00,
                          ),
                          width: getHorizontalSize(
                            388.00,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              4.00,
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
