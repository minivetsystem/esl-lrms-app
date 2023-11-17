import '../controller/home_screen_three_controller.dart';
import 'package:get/get.dart';

class HomeScreenThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenThreeController());
  }
}
