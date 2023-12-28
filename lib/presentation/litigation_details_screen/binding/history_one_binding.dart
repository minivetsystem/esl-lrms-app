import 'package:vedanta_lrms/presentation/litigation_details_screen/litigation_details_screen.dart';
import 'package:get/get.dart';

class LitigationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LitigationDetailsScreen());
  }
}
