import '../controller/view_information_controller.dart';
import 'package:get/get.dart';

class ViewInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewInformationController());
  }
}
