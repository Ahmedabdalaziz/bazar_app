import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:bazar_app/core/utils/app_strings.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppStrings.congratulations,
                height: 90.h,
                width: 160.w,
              ),
              Text(s.welcomeMessage, style: theme.textTheme.displaySmall),
              verticalSpace(16),
              Text(
                s.getStartedPrompt,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.textTheme.bodyLarge?.color?.withOpacity(0.5),
                ),
              ),
              verticalSpace(36),
              SizedBox(
                height: 42.h,
                child: ElevatedButton(
                  onPressed: () {
                    context.pushReplacementNamed(Routing.homeScreen);
                  },
                  child: Text(s.getStartedButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
