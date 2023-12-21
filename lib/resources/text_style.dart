import 'package:flutter/material.dart';
import 'package:registration/resources/color_manager.dart';
import 'font_manager.dart';

class TextStyles {
  static TextStyle textStyleRegular16White = const TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.fontFamily,
      color: Colors.white);

  static TextStyle textStyleBold22White = const TextStyle(
      fontSize: FontSize.s22,
      fontWeight: FontWeightManager.bold,
      fontFamily: FontConstants.fontFamily,
      color: Colors.white);
  static TextStyle textStyleRegular16Grey = TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.fontFamily,
      color: ColorManager.greyText);
  static TextStyle textStyleRegular14Grey = TextStyle(
      fontSize: FontSize.s14,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.fontFamily,
      color: ColorManager.greyText);
  static TextStyle textStyleRegular12Blue = TextStyle(
      fontSize: FontSize.s12,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.fontFamily,
      color: ColorManager.blue);
  static TextStyle textStyleRegular16Orange = TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.fontFamily,
      color: ColorManager.primaryColor);
}
