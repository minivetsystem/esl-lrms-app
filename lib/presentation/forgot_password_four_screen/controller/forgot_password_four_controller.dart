import 'package:truck_booking_app/core/app_export.dart';import 'package:truck_booking_app/presentation/forgot_password_four_screen/models/forgot_password_four_model.dart';import 'package:flutter/material.dart';class ForgotPasswordFourController extends GetxController {TextEditingController masterInputController = TextEditingController();

TextEditingController masterInputOneController = TextEditingController();

TextEditingController masterInputTwoController = TextEditingController();

TextEditingController masterInputThreeController = TextEditingController();

TextEditingController masterInputFourController = TextEditingController();

Rx<ForgotPasswordFourModel> forgotPasswordFourModelObj = ForgotPasswordFourModel().obs;

Rx<bool> isShowPassword = false.obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); masterInputController.dispose(); masterInputOneController.dispose(); masterInputTwoController.dispose(); masterInputThreeController.dispose(); masterInputFourController.dispose(); } 
 }
