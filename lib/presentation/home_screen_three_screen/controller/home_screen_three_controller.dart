import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/presentation/home_screen_three_screen/models/home_screen_three_model.dart';
import 'package:flutter/material.dart';

class HomeScreenThreeController extends GetxController {
  TextEditingController masterInputController = TextEditingController();

  Rx<HomeScreenThreeModel> homeScreenThreeModelObj = HomeScreenThreeModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    masterInputController.dispose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    homeScreenThreeModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    homeScreenThreeModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    selectedDropDownValue1 = value as SelectionPopupModel;
    homeScreenThreeModelObj.value.dropdownItemList1.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    homeScreenThreeModelObj.value.dropdownItemList1.refresh();
  }

  onSelected2(dynamic value) {
    selectedDropDownValue2 = value as SelectionPopupModel;
    homeScreenThreeModelObj.value.dropdownItemList2.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    homeScreenThreeModelObj.value.dropdownItemList2.refresh();
  }
}
