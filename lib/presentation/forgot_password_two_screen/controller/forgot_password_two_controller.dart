import 'package:vedanta_lrms/core/app_export.dart';import 'package:vedanta_lrms/presentation/forgot_password_two_screen/models/forgot_password_two_model.dart';import 'package:sms_autofill/sms_autofill.dart';import 'package:flutter/material.dart';class ForgotPasswordTwoController extends GetxController with  CodeAutoFill {Rx<TextEditingController> otpController = TextEditingController().obs;

Rx<ForgotPasswordTwoModel> forgotPasswordTwoModelObj = ForgotPasswordTwoModel().obs;

@override void codeUpdated() { otpController.value.text = code!; } 
@override void onInit() { super.onInit(); listenForCode(); } 
@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
