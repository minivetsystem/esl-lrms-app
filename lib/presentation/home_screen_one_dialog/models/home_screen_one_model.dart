import 'package:get/get.dart';import 'package:vedanta_lrms/data/models/selectionPopupModel/selection_popup_model.dart';import 'listw_item_model.dart';class HomeScreenOneModel {RxList<SelectionPopupModel> dropdownItemList = [SelectionPopupModel(id:1,title:"test",isSelected:true,),SelectionPopupModel(id:2,title:"test1",),SelectionPopupModel(id:3,title:"test2",)].obs;

RxList<SelectionPopupModel> dropdownItemList1 = [SelectionPopupModel(id:1,title:"test",isSelected:true,),SelectionPopupModel(id:2,title:"test1",),SelectionPopupModel(id:3,title:"test2",)].obs;

RxList<ListwItemModel> listwItemList = RxList.filled(4,ListwItemModel());

 }
