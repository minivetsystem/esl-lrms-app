import 'package:truck_booking_app/core/app_export.dart';import 'package:truck_booking_app/presentation/truck_detail_two_screen/models/truck_detail_two_model.dart';import 'package:flutter/material.dart';class TruckDetailTwoController extends GetxController {TextEditingController groupEightyFourController = TextEditingController();

Rx<TruckDetailTwoModel> truckDetailTwoModelObj = TruckDetailTwoModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); groupEightyFourController.dispose(); } 
 }
