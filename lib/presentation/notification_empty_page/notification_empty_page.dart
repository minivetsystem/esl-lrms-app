import 'controller/notification_empty_controller.dart';
import 'models/notification_empty_model.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_image.dart';
import 'package:vedanta_lrms/widgets/app_bar/appbar_subtitle.dart';
import 'package:vedanta_lrms/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class NotificationEmptyPage extends StatelessWidget {
  NotificationEmptyController controller =
      Get.put(NotificationEmptyController(NotificationEmptyModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(57.00),
                leadingWidth: 44,
                leading: AppbarImage(
                    height: getSize(24.00),
                    width: getSize(24.00),
                    svgPath: ImageConstant.imgArrowleftWhiteA700,
                    margin: getMargin(left: 20, top: 17, bottom: 16),
                    onTap: (){
                      Navigator.pop(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "lbl_notification".tr),
                styleType: Style.bgFillblueA200),
            body: Container(
                width: size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgGroup,
                          height: getVerticalSize(115.00),
                          width: getHorizontalSize(92.00),
                          margin: getMargin(top: 23)),
                      Padding(
                          padding: getPadding(top: 30),
                          child: Text("msg_notification_not".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSFUITextBold17
                                  .copyWith(height: getVerticalSize(1.08))))
                    ]))));
  }

  onTapArrowleft13() {
    Get.back();
  }
}
