import 'package:vedanta_lrms/core/app_export.dart';import 'package:vedanta_lrms/presentation/home_screen_one_dialog/models/home_screen_one_model.dart';class HomeScreenOneController extends GetxController {Rx<HomeScreenOneModel> homeScreenOneModelObj = HomeScreenOneModel().obs;

SelectionPopupModel? selectedDropDownValue;

SelectionPopupModel? selectedDropDownValue1;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
onSelected(dynamic value) { selectedDropDownValue = value as SelectionPopupModel; homeScreenOneModelObj.value.dropdownItemList.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); homeScreenOneModelObj.value.dropdownItemList.refresh(); } 
onSelected1(dynamic value) { selectedDropDownValue1 = value as SelectionPopupModel; homeScreenOneModelObj.value.dropdownItemList1.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); homeScreenOneModelObj.value.dropdownItemList1.refresh(); } 
 }
