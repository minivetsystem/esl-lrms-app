import '../controller/home_one_controller.dart';
import 'package:get/get.dart';

class HomeOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeOneController());
  }
}
