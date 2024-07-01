import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Column(
        children: [
          const SizedBox(
            height: 48.0,
          ),
          Expanded(child: Image.asset('assets/images/onboarding_image.png')),
          Text(
            'Gaste Menos',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo),
          ),
          Text('Poupe Mais',
              textAlign: TextAlign.center,
              style:
                  AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo)),
          Padding(
            padding: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 16.0, bottom: 4.0),
            child: PrimaryButtom(
              text: 'Iniciar',
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
                      .copyWith(color: AppColors.greenTwo)),
            ],
          ),
          const SizedBox(
            height: 24.0,
          )
        ],
      ),
    );
  }
}
