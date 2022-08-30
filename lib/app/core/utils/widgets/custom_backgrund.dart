import 'package:flutter/cupertino.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';

// ignore: must_be_immutable
class CustomBackgrund extends StatelessWidget {
  CustomBackgrund({Key? key, required this.constraints}) : super(key: key);

  BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, constraints.maxHeight * .3),
                    color: AppColors.primary30,
                    blurRadius: 150,
                    spreadRadius: 80),
              ]),
        ),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    offset: Offset(
                        constraints.maxWidth, constraints.maxHeight * .6),
                    color: AppColors.primary30,
                    blurRadius: 150,
                    spreadRadius: 80),
              ]),
        ),
      ],
    );
  }
}
