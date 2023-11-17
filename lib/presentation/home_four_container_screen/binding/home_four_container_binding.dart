import '../controller/home_four_container_controller.dart';
import 'package:get/get.dart';

class HomeFourContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeFourContainerController());
  }
}
