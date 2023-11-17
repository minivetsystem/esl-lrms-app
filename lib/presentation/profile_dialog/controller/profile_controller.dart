import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/presentation/profile_dialog/models/profile_model.dart';

class ProfileController extends GetxController {
  Rx<ProfileModel> profileModelObj = ProfileModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
