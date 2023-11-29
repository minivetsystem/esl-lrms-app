import 'dart:async';

import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/splash_screen/models/splash_model.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;
  @override
  Future<void> onReady() async {
   bool isSignIn = await PrefUtils.getIsSignIn();
   bool isIntro =  await PrefUtils.getIsIntro();
   super.onReady();
   Timer(const Duration(seconds: 3), () {

    if(isIntro){
     Get.toNamed(AppRoutes.onboardingOneScreen);}
    else if(isSignIn){
     Get.toNamed(AppRoutes.loginScreenOneScreen);
    }
    else{
      Get.toNamed(AppRoutes.homeFourContainerScreen);
    }
   });
  }


  @override
  void onClose() {
    super.onClose();
  }
}
