import 'package:truck_booking_app/core/app_export.dart';import 'package:truck_booking_app/presentation/home_six_dialog/models/home_six_model.dart';class HomeSixController extends GetxController {Rx<HomeSixModel> homeSixModelObj = HomeSixModel().obs;

SelectionPopupModel? selectedDropDownValue;

SelectionPopupModel? selectedDropDownValue1;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
onSelected(dynamic value) { selectedDropDownValue = value as SelectionPopupModel; homeSixModelObj.value.dropdownItemList.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); homeSixModelObj.value.dropdownItemList.refresh(); } 
onSelected1(dynamic value) { selectedDropDownValue1 = value as SelectionPopupModel; homeSixModelObj.value.dropdownItemList1.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); homeSixModelObj.value.dropdownItemList1.refresh(); } 
 }
