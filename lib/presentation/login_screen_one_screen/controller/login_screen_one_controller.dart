import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/presentation/login_screen_one_screen/models/login_screen_one_model.dart';
import 'package:flutter/material.dart';

class LoginScreenOneController extends GetxController {
  TextEditingController masterInputController = TextEditingController();

  TextEditingController masterInputOneController = TextEditingController();

  Rx<LoginScreenOneModel> loginScreenOneModelObj = LoginScreenOneModel().obs;

  Rx<bool> isShowPassword = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    masterInputController.dispose();
    masterInputOneController.dispose();
  }
}
