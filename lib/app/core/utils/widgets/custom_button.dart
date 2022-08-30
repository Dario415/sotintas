import 'package:flutter/material.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final TextStyle? textStyle;

  const CustomButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 100, height ?? 50),
        primary: backgroundColor == null ? AppColors.primary : backgroundColor!,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            )
          : Text(
              title,
              style: textStyle ??
                  TextStyle(
                      color: textColor ?? AppColors.primary, fontSize: 20),
            ),
    );
  }
}
