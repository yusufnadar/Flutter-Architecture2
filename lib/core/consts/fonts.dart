import 'package:flutter/material.dart';
import 'package:real_mert_album/core/consts/app.dart';
import 'package:real_mert_album/core/consts/colors.dart';

class Fonts {
  static TextStyle regularTextStyle({double? fontSize, color}) => TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? AppColors.textColor,
        fontWeight: FontWeight.w400,
        fontFamily: App.fontFamily,
      );

  static TextStyle mediumTextStyle({fontSize, color}) => TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? AppColors.textColor,
        fontWeight: FontWeight.w500,
        fontFamily: App.fontFamily,
      );
}
