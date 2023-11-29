// ignore_for_file: non_constant_identifier_names

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_page.dart';
import '../history_page/widgets/history_item_widget.dart';
import 'controller/history_controller.dart';
import 'models/history_item_model.dart';
import 'models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class HistoryPage extends StatelessWidget {
  HistoryController controller = Get.put(HistoryController(HistoryModel().obs));

  @override
  Widget build(BuildContext context) {
    return CustomPage(widget: get_page(context));
  }

  Widget get_page(context) {
    return WillPopScope(
      onWillPop: () async {
        Future.delayed(const Duration(milliseconds: 1000), () {
          SystemNavigator.pop();
        });
        return false;
      },
      child: ColorfulSafeArea(
          minimum: EdgeInsets.only(top: 20),
          color: ColorConstant.whiteA700,
          child: Scaffold(
              resizeToAvoidBottomInset: false,
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
                        Navigator.pop(context);
                      }),
                  title: AppbarSubtitle(
                      text: "lbl_history".tr, margin: getMargin(left: 16)),
                  styleType: Style.bgFillblueA200),
              body: Padding(
                  padding: getPadding(left: 0, top: 10, right: 0),
                  child: Obx(() => ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: getVerticalSize(12.00));
                      },
                      itemCount: controller
                          .historyModelObj.value.historyItemList.length,
                      itemBuilder: (context, index) {
                        HistoryItemModel model = controller
                            .historyModelObj.value.historyItemList[index];
                        return HistoryItemWidget(model);
                      }))))),
    );
  }
}
