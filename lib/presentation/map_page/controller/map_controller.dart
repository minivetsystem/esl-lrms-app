import 'package:truck_booking_app/core/app_export.dart';
import 'package:flutter/material.dart';
// import 'package:truck_booking_app/presentation/map_page/models/map_model.dart';

class MapController extends GetxController {
  TextEditingController masterInputController = TextEditingController();

  // Rx<MapModel> mapModelObj = MapModel().obs;

  // SelectionPopupModel? selectedDropDownValue;

  // SelectionPopupModel? selectedDropDownValue1;

  // SelectionPopupModel? selectedDropDownValue2;

  @override
  void onReady() {
    super.onReady();

  }

  @override
  void onClose() {
    super.onClose();
  }

  // onSelected( value) {
  //   selectedDropDownValue = value as SelectionPopupModel;
  //   mapModelObj.value.dropdownItemList.forEach((element) {
  //     element.isSelected = false;
  //     if (element.id == value.id) {
  //       element.isSelected = true;
  //     }
  //   });
  //   mapModelObj.value.dropdownItemList.refresh();
  // }

  // onSelected1( value) {
  //   selectedDropDownValue1 = value as SelectionPopupModel;
  //   mapModelObj.value.dropdownItemList1.forEach((element) {
  //     element.isSelected = false;
  //     if (element.id == value.id) {
  //       element.isSelected = true;
  //     }
  //   });
  //   mapModelObj.value.dropdownItemList1.refresh();
  // }

  // onSelected2( value) {
  //   selectedDropDownValue2 = value as SelectionPopupModel;
  //   mapModelObj.value.dropdownItemList2.forEach((element) {
  //     element.isSelected = false;
  //     if (element.id == value.id) {
  //       element.isSelected = true;
  //     }
  //   });
  //   mapModelObj.value.dropdownItemList2.refresh();
  // }
}
