import '../controller/home1_controller.dart';
import 'package:get/get.dart';

class Home1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Home1Controller());
  }
}
