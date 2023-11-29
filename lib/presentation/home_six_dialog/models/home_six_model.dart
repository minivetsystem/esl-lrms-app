import 'package:get/get.dart';import 'package:vedanta_lrms/data/models/selectionPopupModel/selection_popup_model.dart';import 'home_six_item_model.dart';class HomeSixModel {RxList<SelectionPopupModel> dropdownItemList = [SelectionPopupModel(id:1,title:"test",isSelected:true,),SelectionPopupModel(id:2,title:"test1",),SelectionPopupModel(id:3,title:"test2",)].obs;

RxList<SelectionPopupModel> dropdownItemList1 = [SelectionPopupModel(id:1,title:"test",isSelected:true,),SelectionPopupModel(id:2,title:"test1",),SelectionPopupModel(id:3,title:"test2",)].obs;

RxList<HomeSixItemModel> homeSixItemList = RxList.filled(4,HomeSixItemModel());

 }
