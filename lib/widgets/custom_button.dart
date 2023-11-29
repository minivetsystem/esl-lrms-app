import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vedanta_lrms/core/app_export.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Center(
            child: Text(
              text ?? "",
              style: _setFontStyle(),
            ),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.infinity,
        height!.h,
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shadowColor: _setTextButtonShadowColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingT17:
        return getPadding(
          top: 17,
          right: 17,
          bottom: 17,
        );
      case ButtonPadding.PaddingAll4:
        return getPadding(
          all: 4,
        );
      case ButtonPadding.PaddingAll9:
        return getPadding(
          all: 9,
        );
      case ButtonPadding.PaddingT7:
        return getPadding(
          left: 7,
          top: 7,
          bottom: 7,
        );
      case ButtonPadding.PaddingT6:
        return getPadding(
          top: 6,
          right: 6,
          bottom: 6,
        );
      default:
        return getPadding(
          all: 13,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.OutlineblueA200:
        return null;
      case ButtonVariant.FillGray100:
        return ColorConstant.gray100;
      case ButtonVariant.FillRed50:
        return ColorConstant.red50;
      case ButtonVariant.OutlineBlack90016:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillLime100:
        return ColorConstant.lime100;
      case ButtonVariant.OutlineblueA200_1:
      case ButtonVariant.OutlineblueA200_2:
       case ButtonVariant.OutlineredA200_2:
        return null;
      default:
        return ColorConstant.blueA200;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineblueA200:
        return BorderSide(
          color: ColorConstant.blueA200,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineblueA200_1:
        return BorderSide(
          color: ColorConstant.blueA200,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineblueA200_2:
        return BorderSide(
          color: ColorConstant.blueA200,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineredA200_2:
        return BorderSide(
          color: ColorConstant.red500,
          width: getHorizontalSize(
            1.00,
          ),
        );
      default:
        return null;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.OutlineBlack90016:
        return ColorConstant.black90016;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.CustomBorderBL20:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              4.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              20.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              20.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              4.00,
            ),
          ),
        );
      case ButtonShape.RoundedBorder10:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      case ButtonShape.RoundedBorder4:
        return BorderRadius.circular(4);
      default:
        return BorderRadius.circular(12);
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.SFUITextBold18:
        return TextStyle(
          color: ColorConstant.blueA200,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.SFUITex14width400:
        return TextStyle(
          color: ColorConstant.blueA200,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.SFUITextRegular16:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SFUITextRegular17:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SFUITextRegular15:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SFUITextBold14:
        return TextStyle(
          color: ColorConstant.blueA200,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w700,
        );
              case ButtonFontStyle.SFUITextBold15:
        return TextStyle(
          color: ColorConstant.red500,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.SFUITextRegular13:
        return TextStyle(
          color: ColorConstant.red500,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SFUITextRegular17Gray600:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SFUITextBold14WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.SFUITextBold17:
        return TextStyle(
          color: ColorConstant.blueA200,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.SFUITextRegular17blueA200:
        return TextStyle(
          color: ColorConstant.blueA200,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w700,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder4,
  CustomBorderBL20,
  RoundedBorder10,
}

enum ButtonPadding {
  PaddingAll13,
  PaddingT17,
  PaddingAll4,
  PaddingAll9,
  PaddingT7,
  PaddingT6,
}

enum ButtonVariant {
  FillblueA200,
  OutlineblueA200,
  FillGray100,
  OutlineblueA200_1,
  OutlineblueA200_2,
  FillRed50,
  OutlineBlack90016,
  FillLime100,
  OutlineredA200_2,
}

enum ButtonFontStyle {
  SFUITextBold18WhiteA700,
  SFUITex14width400,
  SFUITextBold18,
  SFUITextRegular16,
  SFUITextRegular17,
  SFUITextRegular15,
  SFUITextBold14,
  SFUITextRegular13,
  SFUITextRegular17Gray600,
  SFUITextBold14WhiteA700,
  SFUITextBold17,
  SFUITextRegular17blueA200, SFUITextBold15,
}
