import '../constants/app_fonts.dart';
import '../enums/font_type.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle _getTextStyle(
    double fontSize,
    String fontFamily,
    FontWeight fontWeight,
    Color color, {
    double? letterSpacing,
    double? wordSpacing,
    double? height,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      fontWeight: fontWeight,
    );
  }

// regular style

  static TextStyle getRegularStyle({
    double fontSize = AppFontSizes.s12,
    required Color color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
  }) {
    return _getTextStyle(
      fontSize,
      FontType.poppins.name,
      AppFontWeights.regular,
      color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
    );
  }
// light text style

  static TextStyle getLightStyle({
    double fontSize = AppFontSizes.s12,
    required Color color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
  }) {
    return _getTextStyle(
      fontSize,
      FontType.poppins.name,
      AppFontWeights.light,
      color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
    );
  }
// bold text style

  static TextStyle getBoldStyle({
    double fontSize = AppFontSizes.s12,
    required Color color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
  }) {
    return _getTextStyle(
      fontSize,
      FontType.poppins.name,
      AppFontWeights.bold,
      color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
    );
  }

// semi bold text style

  static TextStyle getSemiBoldStyle({
    double fontSize = AppFontSizes.s12,
    required Color color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
  }) {
    return _getTextStyle(
      fontSize,
      FontType.poppins.name,
      AppFontWeights.semiBold,
      color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
    );
  }

// medium text style

  static TextStyle getMediumStyle({
    double fontSize = AppFontSizes.s12,
    required Color color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
  }) {
    return _getTextStyle(
      fontSize,
      FontType.poppins.name,
      AppFontWeights.medium,
      color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
    );
  }
}
