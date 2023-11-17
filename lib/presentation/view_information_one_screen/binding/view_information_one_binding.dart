import '../controller/view_information_one_controller.dart';
import 'package:get/get.dart';

class ViewInformationOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewInformationOneController());
  }
}
