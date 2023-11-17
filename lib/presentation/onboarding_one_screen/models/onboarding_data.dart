import 'package:get/get.dart';

import '../../../core/utils/image_constant.dart';
import 'onboarding_one_model.dart';

class OnboardingData {
  static List<OnboardingOneModel> getOnboardingPage() {
    return [
      OnboardingOneModel(ImageConstant.imgSemitrailertr, "lbl_find_trucks".tr,
          "msg_search_and_choose".tr),
      OnboardingOneModel(ImageConstant.imgPackagingboxes, "lbl_make_booking".tr,
          "msg_lorem_ipsum_dolor".tr),
      OnboardingOneModel(ImageConstant.imgProfessionaltr,
          "msg_real_time_tracking".tr, "msg_morbi_convallis".tr),
    ];
  }
}
