import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../generated/l10n.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(24.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.welcomeMessage,
            style: theme.textTheme.headlineMedium!.copyWith(
              fontSize: 28.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          verticalSpace(4),
          Text(
            s.signToYourAccount,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 16.sp,
              color: theme.colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }
}
