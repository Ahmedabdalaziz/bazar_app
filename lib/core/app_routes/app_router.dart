import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/home_screen.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/welcome_screen.dart';
import 'package:bazar_app/feature/signup/logic/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/login/logic/login_cubit.dart';
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

      case Routing.loginScreen:
        return createRoute(
          BlocProvider(create: (context) => LoginCubit(), child: LoginScreen()),
        );

      case Routing.signupScreen:
        return createRoute(
          BlocProvider(
            create: (context) => SignupCubit(),
            child: SignupScreen(),
          ),
        );

      case Routing.welcomeScreen:
        return createRoute(const WelcomeScreen());

      case Routing.homeScreen:
        return createRoute(const HomeScreen());
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
