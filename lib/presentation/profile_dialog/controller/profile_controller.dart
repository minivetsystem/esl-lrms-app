import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/profile_dialog/models/profile_model.dart';

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
