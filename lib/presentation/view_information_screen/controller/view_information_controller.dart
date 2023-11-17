import 'package:truck_booking_app/core/app_export.dart';import 'package:truck_booking_app/presentation/view_information_screen/models/view_information_model.dart';import 'package:flutter/material.dart';class ViewInformationController extends GetxController {TextEditingController masterInputController = TextEditingController();

TextEditingController masterInputOneController = TextEditingController();

TextEditingController emailController = TextEditingController();

TextEditingController mobileNoController = TextEditingController();

TextEditingController passwordController = TextEditingController();

Rx<ViewInformationModel> viewInformationModelObj = ViewInformationModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); masterInputController.dispose(); masterInputOneController.dispose(); emailController.dispose(); mobileNoController.dispose(); passwordController.dispose(); } 
 }
