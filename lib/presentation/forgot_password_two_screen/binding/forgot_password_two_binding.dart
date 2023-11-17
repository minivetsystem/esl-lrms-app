import '../controller/forgot_password_two_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordTwoController());
  }
}
