import 'package:vedanta_lrms/core/app_export.dart';import 'package:vedanta_lrms/presentation/add_new_card_screen/models/add_new_card_model.dart';import 'package:flutter/material.dart';class AddNewCardController extends GetxController {TextEditingController masterInputOneController = TextEditingController();

TextEditingController masterInputThreeController = TextEditingController();

TextEditingController masterInputFourController = TextEditingController();

Rx<AddNewCardModel> addNewCardModelObj = AddNewCardModel().obs;

SelectionPopupModel? selectedDropDownValue;

SelectionPopupModel? selectedDropDownValue1;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); masterInputOneController.dispose(); masterInputThreeController.dispose(); masterInputFourController.dispose(); } 
onSelected(dynamic value) { selectedDropDownValue = value as SelectionPopupModel; addNewCardModelObj.value.dropdownItemList.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); addNewCardModelObj.value.dropdownItemList.refresh(); } 
onSelected1(dynamic value) { selectedDropDownValue1 = value as SelectionPopupModel; addNewCardModelObj.value.dropdownItemList1.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); addNewCardModelObj.value.dropdownItemList1.refresh(); } 
 }
