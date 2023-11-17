import '../controller/login_screen_one_controller.dart';
import 'package:get/get.dart';

class LoginScreenOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenOneController());
  }
}
