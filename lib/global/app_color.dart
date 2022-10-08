import 'package:flutter/material.dart';

class AppColors {
  static Color backgroundColor = const Color(0xFFEFEFEF);
  static Color whiteColor = const Color(0xFFFCFCFC);
  static Color primaryColor = const Color(0xFFFFBB00);
  static Color secondaryColor = const Color(0xFFE7E3CF);
  static Color primaryTextColor = const Color(0xFF2B2B2B);
  static Color secondaryTextColor = const Color(0xFFA7A7A7);
  static final accentColor = Colors.orangeAccent[700];

  static Map<int, Color> customColor = {
    50: const Color.fromRGBO(20, 35, 60, .1),
    100: const Color.fromRGBO(20, 35, 60, .2),
    200: const Color.fromRGBO(20, 35, 60, .3),
    300: const Color.fromRGBO(20, 35, 60, .4),
    400: const Color.fromRGBO(20, 35, 60, .5),
    500: const Color.fromRGBO(20, 35, 60, .6),
    600: const Color.fromRGBO(20, 35, 60, .7),
    700: const Color.fromRGBO(20, 35, 60, .8),
    800: const Color.fromRGBO(20, 35, 60, .9),
    900: const Color.fromRGBO(20, 35, 60, 1),
  };

  static MaterialColor mainColorWithSwatch =
      MaterialColor(0xFFFFBB00, AppColors.customColor);
}
