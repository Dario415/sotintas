import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/core/utils/widgets/custom_button.dart';
import 'package:sotintas/app/core/utils/widgets/custom_text_fiel.dart';
import 'package:sotintas/app/login/controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _controller = GetIt.I.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Form(
          key: _formKey,
          child: Container(
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
                Observer(builder: (context) {
                  return CustomButton(
                    title: 'Login',
                    isLoading: _controller.isLoading,
                    width: constraints.maxWidth / 2,
                    backgroundColor: AppColors.white,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _controller.authentication();
                      }
                    },
                  );
                }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
