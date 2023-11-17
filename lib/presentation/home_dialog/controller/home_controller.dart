import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/presentation/home_dialog/models/home_model.dart';

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
