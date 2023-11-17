import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/pref_utils.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';

class AccountCreatedDialogue extends StatefulWidget {
  const AccountCreatedDialogue({Key? key}) : super(key: key);

  @override
  State<AccountCreatedDialogue> createState() => _AccountCreatedDialogueState();
}

class _AccountCreatedDialogueState extends State<AccountCreatedDialogue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 18,
        top: 32,
        right: 18,
        bottom: 32,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder28,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDone608511060851100,
            height: getSize(
              108.00,
            ),
            width: getSize(
              108.00,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 25,
            ),
            child: Text(
              "Account Created",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSFUITextBold17.copyWith(
                height: getVerticalSize(
                  1.2,
                ),
              ),
            ),
          ),
          Container(
            width: getHorizontalSize(
              267.00,
            ),
            margin: getMargin(
              top: 15,
            ),
            child: Text(
              "Your account has been successfully created!",
              maxLines: null,
              textAlign: TextAlign.center,
              style: AppStyle.txtSFUITextRegular17Gray60001.copyWith(
                height: getVerticalSize(
                  1.5,
                ),
              ),
            ),
          ),
          CustomButton(
            onTap: (){
              PrefUtils.setIsSignIn(false);
              Get.toNamed(AppRoutes.homeFourContainerScreen);
            },
            height: 50,
            width: 180,
            text: "lbl_ok".tr,
            margin: getMargin(
              top: 21,
            ),
          ),
        ],
      ),
    );
  }
}
