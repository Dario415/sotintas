import 'package:flutter/material.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/core/utils/widgets/custom_button.dart';
import 'package:sotintas/app/core/utils/widgets/custom_text_fiel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(24.0),
          color: AppColors.primary,
          child: Column(
            children: [
              const CustomTextFiel(
                label: 'Email',
                hint: 'fernandasilva@onu.com.br',
              ),
              const CustomTextFiel(
                label: 'Senha',
                hint: '********',
                isPassword: true,
              ),
              CustomButton(
                title: 'Login',
                width: constraints.maxWidth / 2,
                backgroundColor: AppColors.white,
              ),
            ],
          ),
        );
      }),
    );
  }
}
