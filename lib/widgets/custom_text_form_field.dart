import 'package:flutter/material.dart';
import 'package:truck_booking_app/core/app_export.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator,
      this.function,
      this.onFieldSubmitted,
      this.onChanged,
      this.hintStyle,
      required this.shadowTextfield});

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? hintText;
  TextStyle? hintStyle;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;
  bool shadowTextfield = false;

  ValueChanged<String>? onFieldSubmitted;
  ValueChanged<String>? onChanged;
  Function? function;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      decoration: shadowTextfield
          ? BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 16,
                  color: ColorConstant.black900.withOpacity(0.09))
            ])
          : BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
      width: getHorizontalSize(width ?? 0),
      margin: margin,
      child: TextFormField(
        onTap: () {
          // ignore: unnecessary_statements
          function!() ?? () {};
        },
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        focusNode: focusNode,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle() ??
          TextStyle(
            color: ColorConstant.gray600,
            fontSize: getFontSize(
              15,
            ),
            fontFamily: 'SF UI Text',
            fontWeight: FontWeight.w400,
          ),
      border: _setBorderStyle(),
      errorBorder: OutlineInputBorder(
        borderRadius: _setOutlineBorderRadius(),
        borderSide: BorderSide(
          color: ColorConstant.red500,
          width: 1,
        ),
      ),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.SFUITextRegular15Red500:
        return TextStyle(
          color: ColorConstant.red500,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.SFUITextRegular15White400:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.SFUITextRegular17:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.SFUITextRegular15Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'SF UI Text',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.RoundedBorder10:
        return BorderRadius.circular(
          getHorizontalSize(
            12.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            12.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.OutlineBlack90016:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineGray400:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.lightgray,
            width: 1,
          ),
        );
      case TextFormFieldVariant.UnderLineGray300:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstant.gray300,
          ),
        );
      case TextFormFieldVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.OutlineBlack90016:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.OutlineGray400:
        return ColorConstant.whiteA700;
      default:
        return ColorConstant.gray100;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.OutlineBlack90016:
        return true;
      case TextFormFieldVariant.OutlineGray400:
        return true;
      case TextFormFieldVariant.UnderLineGray300:
        return false;
      case TextFormFieldVariant.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingT14_1:
        return getPadding(
          top: 14,
          bottom: 14,
        );
      case TextFormFieldPadding.PaddingAll14:
        return getPadding(
          all: 14,
        );
      default:
        return getPadding(
          top: 14,
          right: 14,
          bottom: 14,
        );
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder4,
  RoundedBorder10,
}

enum TextFormFieldPadding {
  PaddingT14,
  PaddingT14_1,
  PaddingAll14,
}

enum TextFormFieldVariant {
  None,
  FillGray100,
  OutlineBlack90016,
  OutlineGray400,
  UnderLineGray300,
}

enum TextFormFieldFontStyle {
  SFUITextRegular15,
  SFUITextRegular15Red500,
  SFUITextRegular17,
  SFUITextRegular15Black900,
  SFUITextRegular15White400,
}
