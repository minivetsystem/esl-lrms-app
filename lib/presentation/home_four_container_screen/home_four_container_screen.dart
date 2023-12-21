import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:vedanta_lrms/presentation/survey_list_page/survey_list_page.dart';
import 'package:vedanta_lrms/presentation/map_page/map_screen.dart';
import 'package:vedanta_lrms/presentation/profile_one_screen/profile_one_screen.dart';
import 'package:vedanta_lrms/presentation/search_one_screen/search_one_screen.dart';

import '../../widgets/custom_page.dart';
import '../home_screen_main/home_main_screen.dart';
import '../notification_screen/notification_screen.dart';
import 'controller/home_four_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/widgets/custom_bottom_bar.dart';

class HomeFourContainerScreen extends GetWidget<HomeFourContainerController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Future.delayed(const Duration(milliseconds: 1000), () {
            SystemNavigator.pop();
          });
          return false;
        },
        child: CustomPage(
          widget: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: ColorConstant.whiteA700,
              body: Navigator(
                  key: Get.nestedKey(1),
                  initialRoute: AppRoutes.HomeMainScreen,
                  onGenerateRoute: (routeSetting) => GetPageRoute(
                      page: () => getCurrentPage(routeSetting.name!),
                      transition: Transition.noTransition)),
              bottomNavigationBar: kIsWeb
                  ? Container(
                      width: 428,
                      child: CustomBottomBar(onChanged: (BottomBarEnum type) {
                        Get.toNamed(getCurrentRoute(type), id: 1);
                      }),
                    )
                  : CustomBottomBar(onChanged: (BottomBarEnum type) {
                      Get.toNamed(getCurrentRoute(type), id: 1);
                    })),
        ));
  }

  String getCurrentRoute(BottomBarEnum type) {
    print(type);
    switch (type) {
      case BottomBarEnum.Contrastwhitea700:
        return AppRoutes.HomeMainScreen;
      case BottomBarEnum.Globe:
        return AppRoutes.mapScreen;
      case BottomBarEnum.Sort:
        return AppRoutes.searchOneScreen;
      case BottomBarEnum.legal:
        return AppRoutes.historyPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profileOneScreen;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.HomeMainScreen:
        return HomeMainScreen();
      case AppRoutes.mapScreen:
        return MapScreen(id: 0, searchPlotId: 0);
      case AppRoutes.historyPage:
        return SurveyListPage();
      // return SearchOneScreen();

      case AppRoutes.notificationScreen:
        return NotificationScreen();
      case AppRoutes.profileOneScreen:
        return ProfileOneScreen();
      default:
        return DefaultWidget();
    }
  }
}
