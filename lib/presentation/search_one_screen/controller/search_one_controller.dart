import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/search_one_screen/models/search_one_model.dart';
import 'package:flutter/material.dart';

class SearchOneController extends GetxController {
  TextEditingController group267Controller = TextEditingController();

  Rx<LayerList> searchOneModelObj = LayerList().obs;
String? address;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    group267Controller.dispose();
  }

  void setAdress(String value) {
    address = value;
    update();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    group267Controller.dispose();
    super.dispose();
  }
}
