import 'package:vedanta_lrms/presentation/survey_details_screen/survey_details_screen.dart';
import 'package:get/get.dart';

class SurveyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SurveyDetailsScreen());
  }
}
