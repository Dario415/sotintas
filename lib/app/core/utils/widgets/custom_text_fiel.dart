import 'package:flutter/material.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/core/utils/themes/app_font_style.dart';

class CustomTextFiel extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool isEmail;
  final bool isName;
  final bool isPassword;

  const CustomTextFiel({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.isEmail = false,
    this.isName = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<CustomTextFiel> createState() => _CustomTextFielState();
}

class _CustomTextFielState extends State<CustomTextFiel> {
  late bool obscurePass;

  @override
  void initState() {
    widget.isPassword ? obscurePass = true : obscurePass = false;
    super.initState();
  }

  void visibleOrHidden() {
    setState(() {
      obscurePass = !obscurePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Container(
                margin: const EdgeInsets.only(bottom: 8, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.label!, style: AppFontStyle.textFildLabel),
                  ],
                ),
              )
            : Container(),
        TextFormField(
          controller: widget.controller,
          obscureText: obscurePass,
          cursorColor: AppColors.primary30,
          style: AppFontStyle.textFild,
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.white40,
              hintText: widget.hint,
              hintStyle: AppFontStyle.textFild,
              suffixIcon: widget.isPassword
                  ? obscurePass
                      ? InkWell(
                          onTap: () => visibleOrHidden(),
                          child: Icon(
                            Icons.visibility_off,
                            color: AppColors.white80,
                          ),
                        )
                      : InkWell(
                          onTap: () => visibleOrHidden(),
                          child: Icon(
                            Icons.visibility,
                            color: AppColors.white80,
                          ),
                        )
                  : null),
          validator: (value) {
            final regExpEmail = RegExp(
                r'(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))');
            if (value!.isEmpty && widget.isEmail) {
              return 'Insira um email';
            } else if (widget.isEmail && !regExpEmail.hasMatch(value)) {
              return 'Insira um email válido';
            }
            if (value.isEmpty && widget.isName) {
              return 'Insira um nome';
            } else if (widget.isName && value.length <= 3) {
              return 'Insira uma nome válido';
            }

            if (widget.isPassword && value.length < 6) {
              return 'senha invalida !';
            }
            return null;
          },
        ),
      ],
    );
  }
}
