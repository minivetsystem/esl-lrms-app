import 'package:flutter/material.dart';
import 'package:vedanta_lrms/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillblueA200 => BoxDecoration(
        color: ColorConstant.blueA200,
      );
  static BoxDecoration get fillLime100 => BoxDecoration(
        color: ColorConstant.lime100,
      );
  static BoxDecoration get fillChateMessege => BoxDecoration(
    color: ColorConstant.chatContainerColor,
  );
  static BoxDecoration get fillBlack9007f => BoxDecoration(
        color: ColorConstant.black9007f,
      );
  static BoxDecoration get outlineGray30001 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.gray30001,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get fillGray600 => BoxDecoration(
        color: ColorConstant.gray600,
      );
  static BoxDecoration get outlineRed500 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.red500,
          width: getHorizontalSize(
            1.00,
          ),
          // strokeAlign: StrokeAlign.outside,
        ),
      );
  static BoxDecoration get outlineGray3001 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get fillBlack900 => BoxDecoration(
        color: ColorConstant.black900,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get outlineGray300 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get  paymentOptionFormate => BoxDecoration(
    color: ColorConstant.whiteA700,
    borderRadius: BorderRadius.all(Radius.circular(12)),
    border: Border.all(
      color: ColorConstant.chatContainerColor,
      width: getHorizontalSize(
        1.00,
      ),
    ),
  );
  static BoxDecoration get outlineGray400 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.gray400,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get txtFillblue50 => BoxDecoration(
        color: ColorConstant.yellow.withOpacity(0.17),
      );
  static BoxDecoration get outlineBlack90016 => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black90016.withOpacity(0.09),
            spreadRadius: getHorizontalSize(
              0.00,
            ),
            blurRadius: getHorizontalSize(
              16.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get textFildContainer => BoxDecoration(
    color: ColorConstant.textFilledborderColor,
   borderRadius: BorderRadius.circular(4),
    border: Border.all(color: ColorConstant.gray400)
  );
  static BoxDecoration get txtFillblueA200 => BoxDecoration(
        color: ColorConstant.blueA200,
      );
  static BoxDecoration get txtFillGreen50 => BoxDecoration(
        color: ColorConstant.green50,
      );
  static BoxDecoration get fillGray200 => BoxDecoration(
        color: ColorConstant.gray200,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
}

class BorderRadiusStyle {
  static BorderRadius txtCircleBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16.00,
    ),
  );

  static BorderRadius roundedBorder28 = BorderRadius.circular(
    getHorizontalSize(
      28.00,
    ),
  );

  static BorderRadius customBorderTL40 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        40.00,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        40.00,
      ),
    ),
  );

  static BorderRadius circleBorder24 = BorderRadius.circular(
    getHorizontalSize(
      24.00,
    ),
  );

  static BorderRadius roundedBorder4 = BorderRadius.circular(
    getHorizontalSize(
      4.00,
    ),
  );

  static BorderRadius circleBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20.00,
    ),
  );

  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10.00,
    ),
  );

  static BorderRadius circleBorder50 = BorderRadius.circular(
    getHorizontalSize(
      50.00,
    ),
  );

  static BorderRadius circleBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16.00,
    ),
  );

  static BorderRadius customBorderBL20 = BorderRadius.circular(
    10
  );

  static BorderRadius txtRoundedBorder4 = BorderRadius.circular(
    getHorizontalSize(
      4.00,
    ),
  );

  static BorderRadius customBorderBL30 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        30.00,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        30.00,
      ),
    ),
  );
}
