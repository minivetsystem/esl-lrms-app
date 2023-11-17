import 'controller/iphone_14_plus_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';

class Iphone14PlusOneScreen extends GetWidget<Iphone14PlusOneController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          height: getVerticalSize(
            926.00,
          ),
          width: size.width,
        ),
      ),
    );
  }
}
