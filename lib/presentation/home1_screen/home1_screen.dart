import '../home_screen_main/home_main_screen.dart';
import 'controller/home1_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/survey_list_page/survey_list_page.dart';
import 'package:vedanta_lrms/presentation/notification_empty_page/notification_empty_page.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_circleimage.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';
import 'package:vedanta_lrms/widgets/custom_bottom_bar.dart';
import 'package:vedanta_lrms/widgets/custom_button.dart';
import 'package:vedanta_lrms/widgets/custom_drop_down.dart';
import 'package:vedanta_lrms/widgets/custom_icon_button.dart';
import 'package:vedanta_lrms/widgets/custom_text_form_field.dart';

class Home1Screen extends GetWidget<Home1Controller> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  79.00,
                ),
                width: size.width,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: getPadding(
                          left: 20,
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
                              style:
                                  AppStyle.txtSFUITextBold27WhiteA700.copyWith(
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
                            Row(
                              children: [
                                AppbarImage(
                                  height: getSize(
                                    24.00,
                                  ),
                                  width: getSize(
                                    24.00,
                                  ),
                                  svgPath: ImageConstant.imgPlus,
                                  margin: getMargin(
                                    top: 1,
                                  ),
                                ),
                                AppbarSubtitle(
                                  text: "lbl_title".tr,
                                  margin: getMargin(
                                    left: 16,
                                  ),
                                ),
                              ],
                            ),
                            AppbarSubtitle1(
                              text: "lbl_title".tr,
                              margin: getMargin(
                                top: 1,
                                right: 57,
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
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: getPadding(
                      left: 20,
                      top: 27,
                      right: 20,
                      bottom: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: getMargin(
                            left: 24,
                            right: 55,
                          ),
                          padding: getPadding(
                            all: 4,
                          ),
                          decoration: AppDecoration.outlineGray400.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
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
                                fontStyle: ButtonFontStyle.SFUITextBold17,
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
                                  style: AppStyle.txtSFUITextRegular17Gray600
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
                            top: 45,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "lbl_choose_location".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextBold17.copyWith(
                                      height: getVerticalSize(
                                        1.08,
                                      ),
                                    ),
                                  ),
                                  CustomTextFormField(
                                    shadowTextfield: false,
                                    width: 308,
                                    focusNode: FocusNode(),
                                    controller:
                                        controller.masterInputController,
                                    hintText: "lbl_from".tr,
                                    margin: getMargin(
                                      left: 4,
                                      top: 16,
                                    ),
                                    textInputAction: TextInputAction.done,
                                    prefix: Container(
                                      margin: getMargin(
                                        left: 16,
                                        top: 12,
                                        right: 8,
                                        bottom: 12,
                                      ),
                                      child: CustomImageView(
                                        svgPath:
                                            ImageConstant.imgLocationBlack900,
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
                                      left: 4,
                                      top: 24,
                                    ),
                                    padding: getPadding(
                                      left: 16,
                                      top: 12,
                                      right: 16,
                                      bottom: 12,
                                    ),
                                    decoration:
                                        AppDecoration.fillGray100.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder4,
                                    ),
                                    child: Row(
                                      children: [
                                        CustomImageView(
                                          svgPath: ImageConstant.imgSignal,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              CustomIconButton(
                                height: 64,
                                width: 64,
                                margin: getMargin(
                                  top: 64,
                                  bottom: 29,
                                ),
                                variant: IconButtonVariant.FillLime100,
                                shape: IconButtonShape.CircleBorder32,
                                padding: IconButtonPadding.PaddingAll19,
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgSortblueA200,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "lbl_departure".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtSFUITextBold17.copyWith(
                                        height: getVerticalSize(
                                          1.08,
                                        ),
                                      ),
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
                                          svgPath:
                                              ImageConstant.imgArrowdownGray600,
                                        ),
                                      ),
                                      hintText: "lbl_select_date".tr,
                                      margin: getMargin(
                                        top: 14,
                                      ),
                                      padding: DropDownPadding.PaddingT14,
                                      items: controller
                                          .home1ModelObj.value.dropdownItemList,
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
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "lbl_return".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextBold17.copyWith(
                                      height: getVerticalSize(
                                        1.08,
                                      ),
                                    ),
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
                                        svgPath:
                                            ImageConstant.imgArrowdownGray600,
                                      ),
                                    ),
                                    hintText: "lbl_select_date".tr,
                                    margin: getMargin(
                                      top: 16,
                                    ),
                                    padding: DropDownPadding.PaddingT14,
                                    items: controller
                                        .home1ModelObj.value.dropdownItemList1,
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 24,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "lbl_adult_s".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextBold17.copyWith(
                                      height: getVerticalSize(
                                        1.08,
                                      ),
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
                                          variant:
                                              IconButtonVariant.FillGray100,
                                          padding:
                                              IconButtonPadding.PaddingAll6,
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
                                          variant:
                                              IconButtonVariant.FillGray100,
                                          padding:
                                              IconButtonPadding.PaddingAll6,
                                          child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgPlusBlack900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "lbl_class".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFUITextBold17.copyWith(
                                      height: getVerticalSize(
                                        1.08,
                                      ),
                                    ),
                                  ),
                                  CustomDropDown(
                                    width: 186,
                                    focusNode: FocusNode(),
                                    icon: Container(
                                      margin: getMargin(
                                        left: 30,
                                        right: 16,
                                      ),
                                      child: CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowdownGray600,
                                      ),
                                    ),
                                    hintText: "lbl_select_class".tr,
                                    margin: getMargin(
                                      top: 16,
                                    ),
                                    items: controller
                                        .home1ModelObj.value.dropdownItemList2,
                                    onChanged: (value) {
                                      controller.onSelected2(value);
                                    },
                                  ),
                                ],
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  style: AppStyle.txtSFUITextRegular15.copyWith(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  style: AppStyle.txtSFUITextRegular15.copyWith(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  style: AppStyle.txtSFUITextRegular15.copyWith(
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
                        Container(
                          width: getHorizontalSize(
                            388.00,
                          ),
                          margin: getMargin(
                            top: 15,
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
            ],
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
        return SurveyListPage();
      case AppRoutes.notificationEmptyPage:
        return NotificationEmptyPage();
      default:
        return DefaultWidget();
    }
  }
}
