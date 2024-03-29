import 'package:flutter/material.dart';

import '../enums/font_type.dart';

class AppTitle extends StatelessWidget {
  final String title;
  final Color? color;
  final int? maxLines;
  final double? fontSize;
  final String? fontFamily;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  const AppTitle(
    this.title, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.fontFamily,
    this.fontWeight,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: fontFamily ?? FontType.poppins.name,
        color: color ?? Theme.of(context).disabledColor,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 20,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
