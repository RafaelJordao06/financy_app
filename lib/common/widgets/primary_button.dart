import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButtom extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  // ignore: use_super_parameters
  const PrimaryButtom({Key? key, this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(38.0)),
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(38.0)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: onPressed != null
                    ? AppColors.greenGradient
                    : AppColors.greyGradient)),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(38.0)),
          onTap: onPressed,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(38.0))),
            alignment: Alignment.center,
            height: 64.0,
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
