import 'package:truck_booking_app/core/app_export.dart';import 'package:truck_booking_app/presentation/add_new_card_one_screen/models/add_new_card_one_model.dart';import 'package:flutter/material.dart';class AddNewCardOneController extends GetxController {TextEditingController masterInputController = TextEditingController();

TextEditingController masterInputOneController = TextEditingController();

TextEditingController masterInputTwoController = TextEditingController();

Rx<AddNewCardOneModel> addNewCardOneModelObj = AddNewCardOneModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); masterInputController.dispose(); masterInputOneController.dispose(); masterInputTwoController.dispose(); } 
 }
