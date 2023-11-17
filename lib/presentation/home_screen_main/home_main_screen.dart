import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../core/utils/custum_time_picker.dart';
import '../../widgets/custom_button.dart';
// import '../../widgets/custom_page.dart';
import '../search_one_screen/controller/search_one_controller.dart';
import 'controller/home_four_controller.dart';
import 'models/home_four_model.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_circleimage.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:truck_booking_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:truck_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:truck_booking_app/widgets/custom_icon_button.dart';
import 'package:truck_booking_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class HomeMainScreen extends StatelessWidget {
  HomeFourController controller =
      Get.put(HomeFourController(HomeFourModel().obs));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchOneController>(
      init: SearchOneController(),
      builder: (searchOneController) => ColorfulSafeArea(
        color: ColorConstant.whiteA700,
        child: WillPopScope(
          onWillPop: () async {
            Future.delayed(const Duration(milliseconds: 1000), () {
              SystemNavigator.pop();
            });
            return false;
          },
          child: Center(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorConstant.lightGray,
                appBar: CustomAppBar(
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

                body: Center(
                   child: Text("Dashboard"),
                )
                ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget column_widget(context) {
    return GetBuilder<SearchOneController>(
      init: SearchOneController(),
      builder: (searchOneController) => Container(
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImageConstant.imgImage1,
                ),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                searchOneController.address == null
                    ? Padding(
                        padding: getPadding(top: 16, right: 20, left: 20),
                        child: CustomTextFormField(
                          shadowTextfield: true,
                          function: () {
                            Get.toNamed(AppRoutes.searchOneScreen);
                          },
                          textInputType: TextInputType.none,
                          width: double.infinity,
                          focusNode: FocusNode(),
                          controller: controller.group268Controller,
                          hintText: searchOneController.address == null ||
                                  searchOneController.address!.isEmpty
                              ? "lbl_search_location".tr
                              : searchOneController.address,
                          variant: TextFormFieldVariant.OutlineBlack90016,
                          shape: TextFormFieldShape.RoundedBorder10,
                          padding: TextFormFieldPadding.PaddingT14_1,
                          fontStyle: TextFormFieldFontStyle.SFUITextRegular17,
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
                              svgPath: ImageConstant.imgMicrophone,
                            ),
                          ),
                          suffixConstraints: BoxConstraints(
                            maxHeight: getVerticalSize(
                              48.00,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                searchOneController.address == null
                    ? CustomIconButton(
                        alignment: Alignment.centerRight,
                        height: 40,
                        width: 40,
                        margin: getMargin(
                          top: 585,
                        ),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgFrame30,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            searchOneController.address == null ||
                    searchOneController.address!.isEmpty
                ? SizedBox()
                : Padding(
                    padding: getPadding(bottom: 16),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: getPadding(left: 16, right: 16),
                        child: Container(
                          padding: getPadding(
                            left: 16,
                            top: 22,
                            right: 16,
                            bottom: 22,
                          ),
                          decoration: AppDecoration.outlineBlack90016.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Select Your Route",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFUITextBold19Width700black
                                    .copyWith(
                                  height: getVerticalSize(
                                    1.08,
                                  ),
                                ),
                              ),
                              GetBuilder<HomeFourController>(
                                init: HomeFourController(HomeFourModel().obs),
                                builder: (homeFourController) =>
                                    CustomTextFormField(
                                        fontStyle: TextFormFieldFontStyle
                                            .SFUITextRegular15White400,
                                        shadowTextfield: false,
                                        width: double.infinity,
                                        focusNode: FocusNode(),
                                        controller: homeFourController
                                            .group268Controller,
                                        hintText: "Your location",
                                        margin: getMargin(top: 16),
                                        padding:
                                            TextFormFieldPadding.PaddingAll14,
                                        textInputAction: TextInputAction.done),

                                /* GestureDetector(
                                          onTap: () {
                                            homeFourController
                                                .selectDate(context);
                                          },
                                          child: Padding(
                                            padding: getPadding(top: 16),
                                            child: Container(
                                              height: 48,
                                              width: double.infinity,
                                              decoration:
                                                  AppDecoration.textFildContainer,
                                              child: Padding(
                                                padding: getPadding(
                                                    left: 16, right: 16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          margin: getMargin(
                                                            left: 0,
                                                            top: 12,
                                                            right: 8,
                                                            bottom: 12,
                                                          ),
                                                          child: CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgCalendar,
                                                          ),
                                                        ),
                                                        Text(homeFourController
                                                                    .selectedDate ==
                                                                null
                                                            ? "${DateFormat("dd-MM-yyyy").format(controller.date)}"
                                                            : "${DateFormat("dd-MM-yyyy").format(controller.selectedDate!)}")
                                                      ],
                                                    ),
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgArrowdownBlack900,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),*/
                              ),
                              GetBuilder<SearchOneController>(
                                init: SearchOneController(),
                                builder: (searchOneController) =>
                                    CustomTextFormField(
                                        fontStyle: TextFormFieldFontStyle
                                            .SFUITextRegular17,
                                        shadowTextfield: false,
                                        width: double.infinity,
                                        focusNode: FocusNode(),
                                        controller:
                                            controller.destinationController,
                                        hintText:
                                            searchOneController.address == null
                                                ? "Destination"
                                                : searchOneController.address,
                                        margin: getMargin(top: 16),
                                        padding:
                                            TextFormFieldPadding.PaddingAll14,
                                        textInputAction: TextInputAction.done),
                              ),
                              GetBuilder<HomeFourController>(
                                  init: HomeFourController(HomeFourModel().obs),
                                  builder: (homeFourController) => Padding(
                                        padding: getPadding(top: 16),
                                        child: GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  30),
                                                          topLeft:
                                                              Radius.circular(
                                                                  30))),
                                              context: context,
                                              builder: (context) {
                                                return CalendarDatePicker(
                                                  initialDate: homeFourController
                                                              .selectedDate ==
                                                          null
                                                      ? DateTime.now()
                                                      : homeFourController
                                                          .selectedDate!,
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime(2101),
                                                  onDateChanged: (value) {
                                                    homeFourController
                                                        .setDate(value);
                                                  },
                                                );
                                              },
                                            );
                                            // controller
                                            //     .selectDate(context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12)),
                                              color: ColorConstant.gray100,
                                            ),
                                            child: Padding(
                                              padding: getPadding(all: 16),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  homeFourController
                                                              .selectedDate ==
                                                          null
                                                      ? Text(
                                                          "Select date",
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .gray600,
                                                            fontSize:
                                                                getFontSize(
                                                              15,
                                                            ),
                                                            fontFamily:
                                                                'SF UI Text',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        )
                                                      : Text(
                                                          "${DateFormat("dd-MM-yyyy").format(homeFourController.selectedDate!)}",
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .black900,
                                                            fontSize:
                                                                getFontSize(
                                                              15,
                                                            ),
                                                            fontFamily:
                                                                'SF UI Text',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                  Container(
                                                      margin: getMargin(
                                                          left: 30, right: 0),
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgArrowdownBlack900)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                              GetBuilder<HomeFourController>(
                                  init: HomeFourController(HomeFourModel().obs),
                                  builder: (homeFourController) => Padding(
                                        padding: getPadding(top: 16),
                                        child: GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
                                                    topRight:
                                                        Radius.circular(30)),
                                              ),
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding: getPadding(top: 23),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                            "Select Time",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: AppStyle
                                                                .txtSFUITextBold19Width700black
                                                                .copyWith(
                                                                    height:
                                                                        getVerticalSize(
                                                                            1.2))),
                                                      ),
                                                      picker(),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12)),
                                              color: ColorConstant.gray100,
                                            ),
                                            child: Padding(
                                              padding: getPadding(all: 16),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  homeFourController
                                                              .selectedTime ==
                                                          null
                                                      ? Text(
                                                          "Select time",
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .gray600,
                                                            fontSize:
                                                                getFontSize(
                                                              15,
                                                            ),
                                                            fontFamily:
                                                                'SF UI Text',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        )
                                                      : Text(
                                                          "${homeFourController.selectedTime!.format('hh : mm a')}",
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .black900,
                                                            fontSize:
                                                                getFontSize(
                                                              15,
                                                            ),
                                                            fontFamily:
                                                                'SF UI Text',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                  Container(
                                                      margin: getMargin(
                                                          left: 30, right: 0),
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgArrowdownBlack900)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                              CustomButton(
                                onTap: () {
                                  Get.toNamed(AppRoutes.selectTruckScreen);
                                },
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
                    ),
                  ),
          ],
        ),
       ),
    );
  }

  Widget picker() {
    return GetBuilder<HomeFourController>(
      init: HomeFourController(HomeFourModel().obs),
      builder: (homeFourController) => TimePickerSpinner(
        is24HourMode: false,
        normalTextStyle: AppStyle.txtSFUITextRegular17Gray600,

        // TextStyle(
        //     fontSize: 24,
        //     color: Colors.deepOrange
        // ),
        highlightedTextStyle: AppStyle.txtSFUITextBold17Width700black,

        // TextStyle(
        //     fontSize: 24,
        //     color: Colors.yellow
        // ),

        spacing: 50,
        itemHeight: 80,
        isForce2Digits: true,
        onTimeChange: (time) {
          print("Time is===================$time");
          homeFourController.setTime(time);
          // setState(() {
          //   _dateTime = time;
          // });
        },
      ),
    );
  }
}
