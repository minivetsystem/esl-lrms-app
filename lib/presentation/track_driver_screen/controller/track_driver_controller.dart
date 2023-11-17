import 'package:truck_booking_app/core/app_export.dart';import 'package:truck_booking_app/presentation/track_driver_screen/models/track_driver_model.dart';import 'package:flutter/material.dart';class TrackDriverController extends GetxController {TextEditingController masterInputController = TextEditingController();

Rx<TrackDriverModel> trackDriverModelObj = TrackDriverModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); masterInputController.dispose(); } 
 }
