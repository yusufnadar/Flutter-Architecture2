import 'package:flutter/material.dart';
import 'app.dart';
import 'colors.dart';

class Themes {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    fontFamily: App.fontFamily,
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.darkColor,
    fontFamily: App.fontFamily,
  );
}
