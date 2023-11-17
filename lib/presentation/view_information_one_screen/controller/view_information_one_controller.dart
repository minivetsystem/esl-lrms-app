import 'package:truck_booking_app/core/app_export.dart';import 'package:truck_booking_app/presentation/view_information_one_screen/models/view_information_one_model.dart';import 'package:flutter/material.dart';class ViewInformationOneController extends GetxController {TextEditingController passwordController = TextEditingController();

Rx<ViewInformationOneModel> viewInformationOneModelObj = ViewInformationOneModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); passwordController.dispose(); } 
 }
