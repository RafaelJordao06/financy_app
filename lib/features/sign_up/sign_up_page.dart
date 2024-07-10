import 'dart:developer';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/utils/uppercase_text_formatter.dart';
import 'package:financy_app/common/utils/validator.dart';
import 'package:financy_app/common/widgets/custom_bottom_sheet.dart';
import 'package:financy_app/common/widgets/custom_circular_progrees_indicator.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:financy_app/features/sign_up/sign_up_controller.dart';
import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passWordController = TextEditingController();
  final _controller = SignUpController();

  @override
  void dispose() {
    _passWordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator());
      }
      if (_controller.state is SignUpSuccessState) {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Center(
                  child: Text("Nova tela"),
                ),
              ),
            ));
      }

      if (_controller.state is SignUpErrorState) {
        Navigator.pop(context);
        customModalBottomSheet(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Text(
          'Start saving',
          textAlign: TextAlign.center,
          style: AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo),
        ),
        Text('Your Money!',
            textAlign: TextAlign.center,
            style:
                AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo)),
        Image.asset('assets/images/sign_up_image.png'),
        Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: "Nome",
                  hintText: "ENZO",
                  inputFormatters: [
                    UpperCaseTextInputFormatter(),
                  ],
                  validator: Validator.validateName,
                ),
                const CustomTextFormField(
                  labelText: "Email",
                  hintText: "enzo@email.com",
                  validator: Validator.validateEmail,
                ),
                PasswordFormField(
                  controller: _passWordController,
                  labelText: "Escolha sua senha",
                  hintText: "********",
                  validator: Validator.validatePassword,
                  helperText:
                      "Deve ter pelo menos 8 caracteres, 1 letra maiúscula e 1 número",
                ),
                PasswordFormField(
                  labelText: "Confirme sua senha",
                  hintText: "********",
                  validator: (value) => Validator.validateConfirmPassword(
                      value, _passWordController.text),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(
              left: 32.0, right: 32.0, top: 16.0, bottom: 4.0),
          child: PrimaryButtom(
            text: 'Cadastrar',
            onPressed: () {
              final valid = _formKey.currentState != null &&
                  _formKey.currentState!.validate();
              if (valid) {
                _controller.doSignUp();
              } else {
                log("erro ao logar");
              }
            },
          ),
        ),
        MultiTextButton(
          // ignore: avoid_print
          onPressed: () => print('oi'),
          children: [
            Text('Já tem conta? ',
                style: AppTextStyles.smallText
                    .copyWith(color: AppColors.darkGrey)),
            Text('Entrar',
                style: AppTextStyles.smallText
                    .copyWith(color: AppColors.greenTwo)),
          ],
        ),
      ],
    ));
  }
}
