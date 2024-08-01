import 'package:flutter/material.dart';

import 'colors.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    //colorScheme: AppColors.kColorScheme,
    brightness: Brightness.light,
    colorSchemeSeed: Colors.yellow,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.yellow[20],
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.yellow[30],
    ),
  );

  static ThemeData darkTheme = ThemeData(
    //colorScheme: AppColors.kDarkColorScheme,
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.yellow,
  );
}
