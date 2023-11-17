import '../controller/search_one_controller.dart';
import 'package:get/get.dart';

class SearchOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchOneController());
  }
}
