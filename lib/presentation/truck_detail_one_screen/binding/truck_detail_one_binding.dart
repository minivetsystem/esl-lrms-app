import '../controller/truck_detail_one_controller.dart';
import 'package:get/get.dart';

class TruckDetailOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TruckDetailOneController());
  }
}
