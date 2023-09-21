import 'package:flutter/material.dart';

import '../extensions/color_from_hex.dart';

abstract class AppColor {
  static Color primary = HexColor.fromHex("#FFF503");
  static Color grey = HexColor.fromHex("#8F8F8F");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color lightYellow = HexColor.fromHex("#FFF503");
  static Color navyBlue = HexColor.fromHex("#192834");
  static Color lightNavyBlue = HexColor.fromHex("#2E5E6D");
  static Color lightGreen = HexColor.fromHex("#00FF48");
  static Color primaryOpacity70 = HexColor.fromHex("#B3FFF503");

  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black = HexColor.fromHex("#000000");
  static Color transparent = Colors.transparent;
}
