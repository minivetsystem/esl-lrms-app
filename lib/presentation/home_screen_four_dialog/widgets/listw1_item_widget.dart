import '../controller/home_screen_four_controller.dart';
import '../models/listw1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';

// ignore: must_be_immutable
class Listw1ItemWidget extends StatelessWidget {
  Listw1ItemWidget(this.listw1ItemModelObj);

  Listw1ItemModel listw1ItemModelObj;

  var controller = Get.find<HomeScreenFourController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: getPadding(
          right: 32,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: getPadding(
                  right: 1,
                ),
                child: Text(
                  "lbl_w".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSFUITextBold17blueA200.copyWith(
                    height: getVerticalSize(
                      1.08,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: getPadding(
                  top: 17,
                  right: 4,
                ),
                child: Text(
                  "lbl_4".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSFUITextRegular17Gray600.copyWith(
                    height: getVerticalSize(
                      1.08,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 17,
              ),
              child: Text(
                "lbl_11".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtSFUITextRegular17Gray600.copyWith(
                  height: getVerticalSize(
                    1.08,
                  ),
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 17,
              ),
              child: Text(
                "lbl_18".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtSFUITextRegular17Gray600.copyWith(
                  height: getVerticalSize(
                    1.08,
                  ),
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 17,
              ),
              child: Text(
                "lbl_25".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtSFUITextRegular17Gray600.copyWith(
                  height: getVerticalSize(
                    1.08,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
