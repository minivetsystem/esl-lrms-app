import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';

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
      icon: ImageConstant.imgSort,
      type: BottomBarEnum.Sort,
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
      icon: ImageConstant.imgUserGray400,
      type: BottomBarEnum.Profile,
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
              onChanged!(bottomMenuList[index].type);
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

enum BottomBarEnum {
  Contrastwhitea700,
  Sort,
  Globe,
  legal,
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

