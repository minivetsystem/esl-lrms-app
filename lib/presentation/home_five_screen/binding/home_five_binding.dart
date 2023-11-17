import '../controller/home_five_controller.dart';
import 'package:get/get.dart';

class HomeFiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeFiveController());
  }
}
