import '../controller/ticket_preview_controller.dart';
import 'package:get/get.dart';

class TicketPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TicketPreviewController());
  }
}
