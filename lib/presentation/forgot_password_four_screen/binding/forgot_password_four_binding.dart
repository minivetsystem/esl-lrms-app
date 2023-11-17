import '../controller/forgot_password_four_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordFourController());
  }
}
