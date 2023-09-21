import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_margin_padding.dart';
import '../../../core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_text.dart';
import '../../../../core/enums/font_type.dart';
import '../../../core/constants/app_fonts.dart';
import '../../../core/utils/text_styles.dart';
import 'app_providers.dart';
import 'app_route_paths.dart';
import 'app_routes.dart';

/// The `appTheme` function returns a `ThemeData` object that defines the color scheme and typography
/// for the Flutter application.
///
/// Args:
///   context (BuildContext): The `context` parameter is a required parameter in the `appTheme`
/// function. It is of type `BuildContext` and represents the current build context of the widget tree.
/// It is used to access the theme data and other resources from the widget tree.
///
/// Returns:
///   The `appTheme` function returns a `ThemeData` object.

class AppFoundation extends StatelessWidget {
  const AppFoundation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.appProviders,
      child: MaterialApp(
        theme: appTheme(context),
        title: AppText.appName,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutePaths.root,
        onGenerateRoute: AppRoutes.routes,
      ),
    );
  }
}

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColor.primary,
    fontFamily: FontType.poppins.name,
    // main colors of the app
    // primaryColor: AppColor.primary,
    // primaryColorLight: AppColor.primaryOpacity70,
    // primaryColorDark: AppColor.darkPrimary,
    disabledColor: AppColor.grey1,
    // ripple color
    splashColor: AppColor.primaryOpacity70,
    // will be used incase of disabled button for example
    // accentColor: AppColor.grey,
    // card view theme
    cardTheme: CardTheme(
      color: AppColor.white,
      shadowColor: AppColor.grey,
      elevation: AppSizes.s4,
    ),
    // App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColor.primary,
      elevation: AppSizes.s4,
      shadowColor: AppColor.primaryOpacity70,
      titleTextStyle: AppTextStyles.getRegularStyle(
        color: AppColor.white,
        fontSize: AppFontSizes.s16,
      ),
    ),
    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: AppColor.grey1,
      buttonColor: AppColor.primary,
      splashColor: AppColor.primaryOpacity70,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppTextStyles.getRegularStyle(color: AppColor.white),
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.s12),
        ),
      ),
    ),

    // Text theme
    textTheme: TextTheme(
      displayLarge: AppTextStyles.getSemiBoldStyle(
        color: AppColor.darkGrey,
        fontSize: AppFontSizes.s16,
      ),
      displayMedium: AppTextStyles.getRegularStyle(
        color: AppColor.white,
        fontSize: AppFontSizes.s16,
      ),
      displaySmall: AppTextStyles.getBoldStyle(
        color: AppColor.primary,
        fontSize: AppFontSizes.s16,
      ),
      headlineMedium: AppTextStyles.getRegularStyle(
        color: AppColor.primary,
        fontSize: AppFontSizes.s14,
      ),
      titleMedium: AppTextStyles.getMediumStyle(
        color: AppColor.lightGrey,
        fontSize: AppFontSizes.s14,
      ),
      titleSmall: AppTextStyles.getMediumStyle(
        color: AppColor.primary,
        fontSize: AppFontSizes.s14,
      ),
      bodyMedium: AppTextStyles.getMediumStyle(color: AppColor.lightGrey),
      bodySmall: AppTextStyles.getRegularStyle(color: AppColor.grey1),
      bodyLarge: AppTextStyles.getRegularStyle(color: AppColor.grey),
    ),
    // input decoration theme (text form field)

    inputDecorationTheme: InputDecorationTheme(
      // filled color
      fillColor: AppColor.navyBlue,
      // filled or not
      filled: true,
      // content padding
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppPaddings.p16,
        vertical: AppPaddings.p12,
      ),
      // hint style
      hintStyle: AppTextStyles.getRegularStyle(color: AppColor.grey1),

      // label style
      labelStyle: AppTextStyles.getMediumStyle(color: AppColor.darkGrey),
      // error style
      errorStyle: AppTextStyles.getRegularStyle(color: AppColor.error),

      // enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.grey, width: AppSizes.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSizes.s8)),
      ),

      // focused border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.primary, width: AppSizes.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSizes.s8)),
      ),

      // error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.error, width: AppSizes.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSizes.s8)),
      ),
      // focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.primary, width: AppSizes.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSizes.s8)),
      ),
    ),
  );
}
