import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/select_truck_screen/models/select_truck_model.dart';

class SelectTruckController extends GetxController {
  Rx<SelectTruckModel> selectTruckModelObj = SelectTruckModel().obs;
  int id=1;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setTruckcategory(int i) {
    id = i;
    update();
  }
}
