import 'package:vedanta_lrms/core/app_export.dart';
import 'package:flutter/material.dart';
import '../models/login_screen_three_model.dart';

class LoginScreenThreeController extends GetxController {
  TextEditingController masterInputController = TextEditingController();

  Rx<LoginScreenThreeModel> loginScreenThreeModelObj =
      LoginScreenThreeModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    masterInputController.dispose();
  }
}
