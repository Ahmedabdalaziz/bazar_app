import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:bazar_app/feature/login/presentation/login_screen/ui/login_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/onboarding/presentation/onboarding_screen/ui/onboarding_screen.dart';
import '../../feature/splash/ui/screens/splash_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routing.splashScreen:
        return createRoute(const SplashScreen());

      case Routing.onboardingScreen:
        return createRoute(OnboardingScreen());

      case Routing.loginScreen:
        return createRoute(LoginScreen());

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
