import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';

class AppFonts {
  static const TextStyle textFildLabel = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
    fontSize: 16,
  );
  static const TextStyle textFildHint = TextStyle(
    color: AppColors.lightPurpleWhite,
    fontSize: 16,
  );

  static const TextStyle appbarTitle = TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        );
}
