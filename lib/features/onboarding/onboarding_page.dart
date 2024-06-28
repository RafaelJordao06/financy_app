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
      body: Align(
        child: Column(
          children: [
            const SizedBox(
              height: 48.0,
            ),
            Expanded(flex: 2, child: Image.asset('assets/images/man.png')),
            Text(
              'Spend Smarter',
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.greenlightTwo),
            ),
            Text('Save More',
                style: AppTextStyles.mediumText
                    .copyWith(color: AppColors.greenlightTwo)),
            Padding(
              padding: const EdgeInsets.only(
                  left: 32.0, right: 32.0, top: 16.0, bottom: 4.0),
              child: PrimaryButtom(
                text: 'Get Started',
                onPressed: () {},
              ),
            ),
            MultiTextButton(
              onPressed: () => print('oi'),
              children: [
                Text('Already have account? ',
                    style: AppTextStyles.smallText
                        .copyWith(color: AppColors.grey)),
                Text('Log In',
                    style: AppTextStyles.smallText
                        .copyWith(color: AppColors.greenlightTwo)),
              ],
            ),
            const SizedBox(
              height: 24.0,
            )
          ],
        ),
      ),
    );
  }
}
