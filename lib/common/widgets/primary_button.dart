import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  // ignore: use_super_parameters
  const PrimaryButton({Key? key, this.onPressed, required this.text})
      : super(key: key);

  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(24.0));

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        height: 48.0,
        decoration: BoxDecoration(
            borderRadius: _borderRadius,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: onPressed != null
                    ? AppColors.greenGradient
                    : AppColors.greyGradient)),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Align(
            child: Text(
              text,
              style:
                  AppTextStyles.mediumText18.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
