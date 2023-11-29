import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/home_dialog/models/home_model.dart';

class HomeController extends GetxController {
  Rx<HomeModel> homeModelObj = HomeModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
