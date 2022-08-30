import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/core/utils/routes/app_routes.dart';
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
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            padding: const EdgeInsets.all(24.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 136, 121, 218),
                  Color.fromARGB(255, 72, 59, 146),
                ],
              ),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * .12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/bucket_and_paint.png',
                        height: 58,
                        width: 58,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'SóTintas',
                        style: TextStyle(
                            fontSize: 36,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .1,
                  ),
                  Text(
                    'Entrar na plataforma',
                    style: TextStyle(
                      fontSize: 22,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .06,
                  ),
                  const CustomTextFiel(
                    label: 'E-mail',
                    hint: 'fernandasilva@onu.com.br',
                    isEmail: true,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const CustomTextFiel(
                    label: 'Senha',
                    hint: '********',
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Observer(builder: (context) {
                    return CustomButton(
                      title: 'Login',
                      isLoading: _controller.isLoading,
                      width: constraints.maxWidth * .65,
                      backgroundColor: AppColors.white,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _controller.authentication();
                          Navigator.pushNamedAndRemoveUntil(
                              context, AppRoutes.home, (route) => false);
                        }
                      },
                      textStyle: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.registration, (route) => false);
                    },
                    child: Text(
                      'Criar conta',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.white40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
