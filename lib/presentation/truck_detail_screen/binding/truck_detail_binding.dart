import '../controller/truck_detail_controller.dart';
import 'package:get/get.dart';

class TruckDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TruckDetailController());
  }
}
