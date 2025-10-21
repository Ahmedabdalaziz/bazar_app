import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:flutter/material.dart';

import '../../feature/login/ui/login_screen.dart';
import '../../feature/onboarding/ui/onboarding_screen.dart';
import '../../feature/signup/ui/signup_screen.dart';
import '../../feature/splash/ui/screens/splash_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routing.splashScreen:
        return createRoute(const SplashScreen());

      case Routing.onboardingScreen:
        return createRoute(const OnboardingScreen());

      case Routing.signupScreen:
        return createRoute(const SignupScreen());

      case Routing.loginScreen:
        return createRoute(const LoginScreen());

      case Routing.homeScreen:
        return createRoute(
          const Scaffold(body: Center(child: Text('home Screen'))),
        );
    }
    return createRoute(
      const Scaffold(body: Center(child: Text('No Route Found'))),
    );
  }
}

Route<dynamic> createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (_, animation, __) => page,
    transitionsBuilder: (_, animation, __, child) {
      const curve = Curves.easeInOut;

      final offsetAnimation = Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: curve));

      final fadeAnimation = CurvedAnimation(parent: animation, curve: curve);

      return SlideTransition(
        position: offsetAnimation,
        child: FadeTransition(opacity: fadeAnimation, child: child),
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
  );
}
