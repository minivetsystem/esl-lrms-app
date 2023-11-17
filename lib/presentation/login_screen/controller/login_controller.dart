import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController groupSixtyNineController = TextEditingController();

  TextEditingController groupFourController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;

  Rx<bool> isShowPassword = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    groupSixtyNineController.dispose();
    groupFourController.dispose();
  }
}
