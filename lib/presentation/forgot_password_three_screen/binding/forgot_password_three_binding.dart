import '../controller/forgot_password_three_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordThreeController());
  }
}
