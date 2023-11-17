import '../controller/truck_detail_three_controller.dart';
import 'package:get/get.dart';

class TruckDetailThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TruckDetailThreeController());
  }
}
