import '../controller/history_empty_controller.dart';
import 'package:get/get.dart';

class HistoryEmptyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryEmptyController());
  }
}
