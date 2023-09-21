import '../constants/app_colors.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context, {
  required String msg,
  Color? color,
  bool isError = false,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color != null && isError == false
          ? color
          : isError
              ? AppColor.error
              : AppColor.lightYellow,
      content: Text(
        msg,
        style: TextStyle(
          color: isError ? AppColor.white : AppColor.navyBlue,
        ),
      ),
    ),
  );
}
