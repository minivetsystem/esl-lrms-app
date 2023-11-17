import 'package:truck_booking_app/core/app_export.dart';import 'package:truck_booking_app/presentation/home_two_dialog/models/home_two_model.dart';class HomeTwoController extends GetxController {Rx<HomeTwoModel> homeTwoModelObj = HomeTwoModel().obs;

SelectionPopupModel? selectedDropDownValue;

SelectionPopupModel? selectedDropDownValue1;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
onSelected(dynamic value) { selectedDropDownValue = value as SelectionPopupModel; homeTwoModelObj.value.dropdownItemList.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); homeTwoModelObj.value.dropdownItemList.refresh(); } 
onSelected1(dynamic value) { selectedDropDownValue1 = value as SelectionPopupModel; homeTwoModelObj.value.dropdownItemList1.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); homeTwoModelObj.value.dropdownItemList1.refresh(); } 
 }
