import 'package:truck_booking_app/core/app_export.dart';import 'package:truck_booking_app/presentation/home_three_dialog/models/home_three_model.dart';class HomeThreeController extends GetxController {Rx<HomeThreeModel> homeThreeModelObj = HomeThreeModel().obs;

SelectionPopupModel? selectedDropDownValue;

SelectionPopupModel? selectedDropDownValue1;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
onSelected(dynamic value) { selectedDropDownValue = value as SelectionPopupModel; homeThreeModelObj.value.dropdownItemList.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); homeThreeModelObj.value.dropdownItemList.refresh(); } 
onSelected1(dynamic value) { selectedDropDownValue1 = value as SelectionPopupModel; homeThreeModelObj.value.dropdownItemList1.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); homeThreeModelObj.value.dropdownItemList1.refresh(); } 
 }
