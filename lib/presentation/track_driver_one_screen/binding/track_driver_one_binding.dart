import '../controller/track_driver_one_controller.dart';
import 'package:get/get.dart';

class TrackDriverOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackDriverOneController());
  }
}
