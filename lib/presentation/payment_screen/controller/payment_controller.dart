import 'package:vedanta_lrms/core/app_export.dart';import 'package:vedanta_lrms/presentation/payment_screen/models/payment_model.dart';import 'package:flutter/material.dart';class PaymentController extends GetxController {TextEditingController masterInputController = TextEditingController();

TextEditingController masterInputOneController = TextEditingController();

TextEditingController masterInputTwoController = TextEditingController();

Rx<PaymentModel> paymentModelObj = PaymentModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); masterInputController.dispose(); masterInputOneController.dispose(); masterInputTwoController.dispose(); } 
 }
