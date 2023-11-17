import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/presentation/search_screen/models/search_model.dart';
import 'package:flutter/material.dart';
class CustomSearchController extends GetxController {
  TextEditingController group268Controller = TextEditingController();

Rx<SearchModel> searchModelObj = SearchModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); group268Controller.dispose(); } 
 }
