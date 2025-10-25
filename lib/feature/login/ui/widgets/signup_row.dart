import 'package:bazar_app/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app_routes/routes_strings.dart';
import '../../../../../../generated/l10n.dart';

class SignupRow extends StatelessWidget {
  const SignupRow({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return Row(
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
    );
  }
}
