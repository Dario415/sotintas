import 'package:flutter/material.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';

class AppFontStyle {
  static TextStyle textFildLabel = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    letterSpacing: .64,
    fontSize: 16,
  );

  static TextStyle textFild = TextStyle(
    color: AppColors.white80,
    fontSize: 16,
  );

  static TextStyle appbarTitle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.lightBlack,
    fontFamily: 'OpenSans',
  );

  static TextStyle cardTitle = TextStyle(
    fontSize: 16,
    color: AppColors.lightBlack,
    fontWeight: FontWeight.bold,
  );

  static TextStyle dropdownItem = TextStyle(
    fontSize: 12,
    color: AppColors.lightBlack,
  );
}
