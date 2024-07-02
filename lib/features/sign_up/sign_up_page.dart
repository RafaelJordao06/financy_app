import 'dart:developer';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/utils/uppercase_text_formatter.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

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
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "esse campo não pode ser vazio!";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  labelText: "Email",
                  hintText: "enzo@email.com",
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "esse campo não pode ser vazio!";
                    }
                    return null;
                  },
                ),
                PasswordFormField(
                  labelText: "Escolha sua senha",
                  hintText: "********",
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "esse campo não pode ser vazio!";
                    }
                    return null;
                  },
                ),
                PasswordFormField(
                  labelText: "Confirme sua senha",
                  hintText: "********",
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "esse campo não pode ser vazio!";
                    }
                    return null;
                  },
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
                log("continuar logica de login");
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
