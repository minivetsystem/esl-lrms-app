import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';
import 'package:vedanta_lrms/presentation/add_new_survey_screen/add_new_survey_screen.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({this.onChanged});

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgContrastWhiteA700,
      type: BottomBarEnum.Contrastwhitea700,
    ),
    BottomMenuModel(
      icon: ImageConstant.globe,
      type: BottomBarEnum.Globe,
    ),
    BottomMenuModel(
      icon: ImageConstant.add,
      type: BottomBarEnum.add,
    ),
    BottomMenuModel(
      icon: ImageConstant.survey,
      type: BottomBarEnum.survey,
    ),
    // BottomMenuModel(
    //   icon: ImageConstant.imgNotification,
    //   type: BottomBarEnum.Notification,
    // ),
    BottomMenuModel(
      icon: ImageConstant.legal,
      type: BottomBarEnum.legal,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: 428,
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                getHorizontalSize(
                  24.00,
                ),
              ),
              topRight: Radius.circular(
                getHorizontalSize(
                  24.00,
                ),
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: ColorConstant.black9000f.withOpacity(0.06),
                spreadRadius: getHorizontalSize(
                  0.00,
                ),
                blurRadius: getHorizontalSize(
                  12.00,
                ),
                offset: Offset(
                  0,
                  -3,
                ),
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            currentIndex: selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            items: List.generate(bottomMenuList.length, (index) {
              return BottomNavigationBarItem(
                icon: CustomImageView(
                  svgPath: bottomMenuList[index].icon,
                  height: getSize(
                    24.00,
                  ),
                  width: getSize(
                    24.00,
                  ),
                  color: ColorConstant.gray600,
                ),
                activeIcon: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  color: ColorConstant.blueA200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusStyle.circleBorder24,
                  ),
                  child: Container(
                    height: getSize(
                      48.00,
                    ),
                    width: getSize(
                      48.00,
                    ),
                    padding: getPadding(
                      all: 12,
                    ),
                    decoration: AppDecoration.fillblueA200.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder24,
                    ),
                    child: Stack(
                      children: [
                        CustomImageView(
                          svgPath: bottomMenuList[index].icon,
                          height: getSize(
                            24.00,
                          ),
                          width: getSize(
                            24.00,
                          ),
                          color: ColorConstant.whiteA700,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ),
                label: '',
              );
            }),
            onTap: (index) {
              selectedIndex.value = index;
              // onChanged!(bottomMenuList[index].type);
              if (bottomMenuList[index].type == BottomBarEnum.add) {
                // Open action sheet for the "Add" tab
                openActionSheet(context);
              } else {
                // Navigate to the selected tab
                onChanged!(bottomMenuList[index].type);
              }
            },
          ),
        ));
  }
}

// String getCurrentRoute(BottomBarEnum type) {
//   switch (type) {
//     case BottomBarEnum.Contrastwhitea700:
//       return AppRoutes.HomeMainScreen;
//     case BottomBarEnum.Globe:
//       return AppRoutes.mapScreen;
//     case BottomBarEnum.Sort:
//       return AppRoutes.searchOneScreen;
//     case BottomBarEnum.survey:
//       return AppRoutes.historyPage;
//     case BottomBarEnum.legal:
//       return AppRoutes.profileOneScreen;
//     default:
//       return "/";
//   }
// }
openActionSheet(context) {
  showAdaptiveActionSheet(
      isDismissible: true,

    context: context,
    title: const Text('Choose'),
    androidBorderRadius: 30,
    actions: <BottomSheetAction>[
      BottomSheetAction(
          title: Text("Add new Survey"),
          onPressed: (context) {
            Navigator.pop(context);
            Get.toNamed(AppRoutes.addNewSurveyScreen);
          }),
    ],
    cancelAction: CancelAction(
        title: const Text(
            'Cancel'),
            ), // onPressed parameter is optional by default will dismiss the ActionSheet
  );
  // showCupertinoModalPopup<void>(
  //   context: context,
  //   builder: (BuildContext context) => CupertinoActionSheet(
  //     title: const Text('Choose'),
  //     actions: <CupertinoActionSheetAction>[
  //       CupertinoActionSheetAction(
  //         isDefaultAction: true,
  //         onPressed: () {
  //           Navigator.pop(context);
  //           Get.toNamed(AppRoutes.addNewSurveyScreen);
  //         },
  //         child: Text("Add new Survey"),
  //       ),
  //       CupertinoActionSheetAction(
  //         /// This parameter indicates the action would perform
  //         /// a destructive action such as delete or exit and turns
  //         /// the action's text color to red.
  //         isDestructiveAction: true,
  //         onPressed: () {
  //           Navigator.pop(context);
  //         },
  //         child: const Text('Close'),
  //       ),
  //     ],
  //   ),
  // );
}

enum BottomBarEnum {
  Contrastwhitea700,
  Sort,
  Globe,
  legal,
  add,
  Notification,
  Usergray400,
  Profile,
  survey
}

class BottomMenuModel {
  BottomMenuModel({required this.icon, required this.type});

  String icon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
