import 'package:flutter/material.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 100, height ?? 40),
        primary: backgroundColor == null ? AppColors.primary : backgroundColor!,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(color: textColor ?? AppColors.primary),
      ),
    );
  }
}
