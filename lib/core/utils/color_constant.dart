import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray600 = fromHex('#7A7A7A');
  // static Color gray600 = fromHex('#797979');

  static Color black9007f = fromHex('#7f000000');

  static Color gray40090 = fromHex('#90bdbaba');

  static Color gray400 = fromHex('#bdbaba');
  static Color lightgray = fromHex('#F4F4F4');

  static Color blueA200 = fromHex('#2395CA');//buttoncolor
  static Color lightGray = fromHex('#f4f4f4');//gray100

  static Color gray60001 = fromHex('#7e7e7e');

  static Color black9000f = fromHex('#0f000000');

  static Color red500 = fromHex('#ff3939');

  static Color green700 = fromHex('#0f993e');

  static Color green50 = fromHex('#e7f4eb');

  static Color gray200 = fromHex('#efefef');

  static Color gray300 = fromHex('#F5F5F5');

  static Color gray30001 = fromHex('#dfdfdf');

  static Color lime100 = fromHex('#f6e1cd');

  static Color gray100 = fromHex('#EBECEF');


  static Color red50 = fromHex('#fbecec');

  static Color yellow = fromHex('#FBBB00');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color black90016 = fromHex('#16000000');
  static Color lightblue = fromHex('#BDD9E5');
  static Color blue = fromHex('#2395CA');
  static Color textFilledColor = fromHex('#F2F2F2');
  static Color textFilledborderColor = fromHex('#F5F5F5');
  static Color gray = fromHex('#7A7A7A');
  static Color chatContainerColor = fromHex('#E3E3E3');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
