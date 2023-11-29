import 'package:vedanta_lrms/core/app_export.dart';import 'package:vedanta_lrms/presentation/forgot_password_screen/models/forgot_password_model.dart';import 'package:flutter/material.dart';class ForgotPasswordController extends GetxController {TextEditingController masterInputController = TextEditingController();

TextEditingController masterInputOneController = TextEditingController();

Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel().obs;

Rx<bool> isShowPassword = false.obs;

Rx<bool> isShowPassword1 = false.obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); masterInputController.dispose(); masterInputOneController.dispose(); } 
 }
