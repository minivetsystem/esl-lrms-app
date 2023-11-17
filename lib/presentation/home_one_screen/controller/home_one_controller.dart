import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/presentation/home_one_screen/models/home_one_model.dart';
import 'package:flutter/material.dart';

class HomeOneController extends GetxController {
  TextEditingController group268Controller = TextEditingController();

  Rx<HomeOneModel> homeOneModelObj = HomeOneModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    group268Controller.dispose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    homeOneModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    homeOneModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    selectedDropDownValue1 = value as SelectionPopupModel;
    homeOneModelObj.value.dropdownItemList1.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    homeOneModelObj.value.dropdownItemList1.refresh();
  }
}
