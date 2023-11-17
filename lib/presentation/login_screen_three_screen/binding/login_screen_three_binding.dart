import '../controller/login_screen_three_controller.dart';
import 'package:get/get.dart';

class LoginScreenThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenThreeController());
  }
}
