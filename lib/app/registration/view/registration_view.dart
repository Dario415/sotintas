import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFiel(
              controller: _nameController,
              isName: true,
              hint: 'nome',
              label: 'Nome',
            ),
            CustomTextFiel(
              controller: _emailController,
              isEmail: true,
              hint: 'fernandasilva@onu.com.br',
              label: 'E-mail',
            ),
            CustomTextFiel(
              controller: _passwordController,
              isPassword: true,
              hint: '********',
              label: 'Senha',
            ),
            CustomTextFiel(
              controller: _confirmPasswordController,
              isPassword: true,
              hint: '********',
              label: 'Confirmar senha',
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width / 2,
              title: 'Criar conta',
              backgroundColor: AppColors.white,
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  print('Cadastrado');
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}
