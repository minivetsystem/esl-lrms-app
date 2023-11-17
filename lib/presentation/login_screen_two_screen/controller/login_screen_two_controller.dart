import 'package:truck_booking_app/core/app_export.dart';import 'package:truck_booking_app/presentation/login_screen_two_screen/models/login_screen_two_model.dart';import 'package:flutter/material.dart';class LoginScreenTwoController extends GetxController {TextEditingController emailController = TextEditingController();

TextEditingController passwordController = TextEditingController();

Rx<LoginScreenTwoModel> loginScreenTwoModelObj = LoginScreenTwoModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); emailController.dispose(); passwordController.dispose(); } 
 }
