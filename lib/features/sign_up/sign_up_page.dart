import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Text(
          'Start saving',
          textAlign: TextAlign.center,
          style:
              AppTextStyles.mediumText.copyWith(color: AppColors.greenlightTwo),
        ),
        Text('Your Money!',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText
                .copyWith(color: AppColors.greenlightTwo)),
        Image.asset('assets/images/sign_up_image.png'),
        const Form(
            child: Column(
          children: [
            CustomTextFormField(
              labelText: "Nome",
              hintText: "Enzo",
            ),
            PasswordFormField(
              labelText: "Escolha sua senha",
              hintText: "********",
            ),
            PasswordFormField(
              labelText: "Confirme sua senha",
              hintText: "********",
            ),
          ],
        )),
        Padding(
          padding: const EdgeInsets.only(
              left: 32.0, right: 32.0, top: 16.0, bottom: 4.0),
          child: PrimaryButtom(
            text: 'Cadastrar',
            onPressed: () {},
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
                    .copyWith(color: AppColors.greenlightTwo)),
          ],
        ),
      ],
    ));
  }
}
