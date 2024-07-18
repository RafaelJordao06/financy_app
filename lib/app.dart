import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/features/onboarding/onboarding_page.dart';
import 'package:financy_app/common/constants/themes/default_theme.dart';
import 'package:financy_app/features/sign_up/sign_up_page.dart';
import 'package:financy_app/features/sing_in/sing_in_page.dart';
import 'package:financy_app/features/splash/splash.page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: defaultTheme,
      initialRoute: NamedRoutes.splash,
      routes: {
        NamedRoutes.initial: (context) => const OnboardingPage(),
        NamedRoutes.splash: (context) => const SplashPage(),
        NamedRoutes.signUp: (context) => const SignUpPage(),
        NamedRoutes.signIn: (context) => const SignInPage(),
      },
    );
  }
}
