import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/app/core/utils/routes/app_routes.dart';
import 'package:sotintas/app/core/utils/themes/app_colors.dart';
import 'package:sotintas/app/core/utils/widgets/custom_button.dart';
import 'package:sotintas/app/core/utils/widgets/custom_text_fiel.dart';
import 'package:sotintas/app/registration/controller/registration_controller.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final _controller = GetIt.I.get<RegistrationController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 136, 121, 218),
              Color.fromARGB(255, 72, 59, 146),
            ],
          )),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
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
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Text(
                    'Criar conta',
                    style: TextStyle(
                      fontSize: 22,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  CustomTextFiel(
                    controller: _nameController,
                    isName: true,
                    hint: 'nome',
                    label: 'Nome',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFiel(
                    controller: _emailController,
                    isEmail: true,
                    hint: 'fernandasilva@onu.com.br',
                    label: 'E-mail',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFiel(
                    controller: _passwordController,
                    isPassword: true,
                    hint: '********',
                    label: 'Senha',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFiel(
                    controller: _confirmPasswordController,
                    isPassword: true,
                    hint: '********',
                    label: 'Confirmar senha',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      width: MediaQuery.of(context).size.width * .60,
                      title: 'Criar conta',
                      backgroundColor: AppColors.white,
                      textStyle: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // _controller.sendUser(
                          //   name: _nameController.text,
                          //   email: _emailController.text,
                          //   password: _passwordController.text,
                          //   confirmPassword: _confirmPasswordController.text,
                          // );
                          Navigator.pushNamedAndRemoveUntil(
                              context, AppRoutes.login, (route) => false);
                        }
                      }),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
