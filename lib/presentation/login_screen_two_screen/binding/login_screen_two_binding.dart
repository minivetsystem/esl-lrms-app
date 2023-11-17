import '../controller/login_screen_two_controller.dart';
import 'package:get/get.dart';

class LoginScreenTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenTwoController());
  }
}
