import 'package:vedanta_lrms/presentation/history_one_screen/history_one_screen.dart';
import 'package:get/get.dart';

class HistoryOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryOneScreen());
  }
}
