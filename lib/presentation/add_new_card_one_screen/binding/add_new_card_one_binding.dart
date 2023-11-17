import '../controller/add_new_card_one_controller.dart';
import 'package:get/get.dart';

class AddNewCardOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewCardOneController());
  }
}
