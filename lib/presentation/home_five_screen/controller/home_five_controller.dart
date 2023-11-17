import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/presentation/home_five_screen/models/home_five_model.dart';
import 'package:flutter/material.dart';

class HomeFiveController extends GetxController {
  TextEditingController group268Controller = TextEditingController();

  Rx<HomeFiveModel> homeFiveModelObj = HomeFiveModel().obs;

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
    homeFiveModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    homeFiveModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    selectedDropDownValue1 = value as SelectionPopupModel;
    homeFiveModelObj.value.dropdownItemList1.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    homeFiveModelObj.value.dropdownItemList1.refresh();
  }
}
