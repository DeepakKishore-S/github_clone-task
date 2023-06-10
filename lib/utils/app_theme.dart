import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff706CFF);
MaterialColor materialPrimaryColor = MaterialColor(primaryColor.value, {
  50: primaryColor.withOpacity(0.1),
  100: primaryColor.withOpacity(0.2),
  200: primaryColor.withOpacity(0.3),
  300: primaryColor.withOpacity(0.4),
  400: primaryColor.withOpacity(0.5),
  500: primaryColor.withOpacity(0.6),
  600: primaryColor.withOpacity(0.7),
  700: primaryColor.withOpacity(0.8),
  800: primaryColor.withOpacity(0.9),
  900: primaryColor.withOpacity(1),
});
const Color secondaryColor = Color(0xff27274A);
MaterialColor materialSecondaryColor = MaterialColor(primaryColor.value, {
  50: primaryColor.withOpacity(0.1),
  100: primaryColor.withOpacity(0.2),
  200: primaryColor.withOpacity(0.3),
  300: primaryColor.withOpacity(0.4),
  400: primaryColor.withOpacity(0.5),
  500: primaryColor.withOpacity(0.6),
  600: primaryColor.withOpacity(0.7),
  700: primaryColor.withOpacity(0.8),
  800: primaryColor.withOpacity(0.9),
  900: primaryColor.withOpacity(1),
});

class AppColors {
  static final primaryColor = materialPrimaryColor;
  static final secondaryColor = materialSecondaryColor;
  static const primaryTextColor = Color(0xff27274A); //#27274A
  static const secondayTextColor = Color(0xff5F607E); //#5F607E
  static const headerTextColor = Colors.white;
  static const errorColor = Colors.red;
}

ThemeData appTheme = ThemeData(
    primarySwatch: AppColors.primaryColor,
    fontFamily: "Inter",
    textTheme: const TextTheme().apply(
      bodyColor: AppColors.primaryTextColor,
      displayColor: AppColors.primaryTextColor,
    ));

class AppTextStyle {
  static const TextStyle titleText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22,
    color: AppColors.headerTextColor,
  );
  static const TextStyle headerText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
  static const TextStyle whiteHeaderText = TextStyle(
    color: AppColors.headerTextColor,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
  static const TextStyle subHeaderText = TextStyle(
    fontSize: 18,
    color: AppColors.secondayTextColor,
  );
  static const TextStyle whiteSubHeaderText = TextStyle(
    fontSize: 18,
    color: AppColors.headerTextColor,
  );
}
