import '../controller/truck_detail_two_controller.dart';
import 'package:get/get.dart';

class TruckDetailTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TruckDetailTwoController());
  }
}
