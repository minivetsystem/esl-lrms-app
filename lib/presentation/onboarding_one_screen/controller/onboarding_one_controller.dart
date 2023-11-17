import 'package:truck_booking_app/core/app_export.dart';
import 'package:truck_booking_app/presentation/onboarding_one_screen/models/onboarding_one_model.dart';

class OnboardingOneController extends GetxController {
  int currentPage = 0;
  int currentIndicater = 0;
  Rx<OnboardingOneModel> onboardingOneModelObj =
      OnboardingOneModel("", "", "").obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onSetPageIndex(int value) {
    currentPage=value;
    update();
  }

  void setidicaterIndex(int index) {
    currentIndicater = index;
    update();
  }
}
