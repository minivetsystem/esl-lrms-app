import 'package:truck_booking_app/core/app_export.dart';import 'package:truck_booking_app/presentation/home_screen_four_dialog/models/home_screen_four_model.dart';class HomeScreenFourController extends GetxController {Rx<HomeScreenFourModel> homeScreenFourModelObj = HomeScreenFourModel().obs;

SelectionPopupModel? selectedDropDownValue;

SelectionPopupModel? selectedDropDownValue1;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
onSelected(dynamic value) { selectedDropDownValue = value as SelectionPopupModel; homeScreenFourModelObj.value.dropdownItemList.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); homeScreenFourModelObj.value.dropdownItemList.refresh(); } 
onSelected1(dynamic value) { selectedDropDownValue1 = value as SelectionPopupModel; homeScreenFourModelObj.value.dropdownItemList1.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); homeScreenFourModelObj.value.dropdownItemList1.refresh(); } 
 }
