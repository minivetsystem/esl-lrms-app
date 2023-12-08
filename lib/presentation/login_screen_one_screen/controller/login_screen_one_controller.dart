import 'package:vedanta_lrms/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class LoginScreenOneController extends GetxController {
  TextEditingController masterInputController = TextEditingController();

  TextEditingController masterInputOneController = TextEditingController();

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
