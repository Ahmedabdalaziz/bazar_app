import 'package:bazar_app/core/api/refresh_and_session_supabase.dart';
import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:bazar_app/core/helpers/local_storage/local_storage.dart';
import 'package:bazar_app/core/utils/app_strings.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goNext();
  }

  Future<void> _goNext() async {
    await Future.delayed(const Duration(seconds: 2));

    final seen = OnboardingStorage().isSeen();
    final isLoggedIn = SupabaseIsAuthenticated.isAuthenticated();

    if (seen == true) {
      if (isLoggedIn) {
        try {
          final session = await SupabaseRefreshSession.refreshSession();
          if (session != null) {
            context.pushReplacementNamed(Routing.homeScreen);
          } else {
            context.pushReplacementNamed(Routing.loginScreen);
          }
        } catch (e) {
          context.pushReplacementNamed(Routing.loginScreen);
        }
      } else {
        context.pushReplacementNamed(Routing.loginScreen);
      }
    } else {
      context.pushReplacementNamed(Routing.onboardingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [Image(image: AssetImage(AppStrings.logoAppSplash))],
        ),
      ),
    );
  }
}
