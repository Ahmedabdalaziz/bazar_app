import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app_routes/routes_strings.dart';
import '../../../../../../generated/l10n.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(s.email, style: theme.textTheme.bodyLarge),
          verticalSpace(8),
          TextFormField(decoration: InputDecoration(hint: Text(s.yourEmail))),
          verticalSpace(16),
          Text(s.password, style: theme.textTheme.bodyLarge),
          verticalSpace(8),
          TextFormField(
            decoration: InputDecoration(hint: Text(s.yourPassword)),
          ),
          verticalSpace(16),
          GestureDetector(
            onTap: () {},
            child: Text(
              s.forgotPassword,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          verticalSpace(24),
          SizedBox(
            width: double.infinity,
            height: 42.h,
            child: ElevatedButton(
              onPressed: () {
                context.pushNamed(Routing.signupScreen);
              },
              style: ElevatedButton.styleFrom(),
              child: Text(
                s.login,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          verticalSpace(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                s.dontHaveAccount,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routing.signupScreen);
                },
                child: Text(
                  s.signUp,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
