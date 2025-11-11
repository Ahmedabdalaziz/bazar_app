import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          s.haveAccount,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: theme.colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        horizontalSpace(8),
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Text(
            s.signIn,
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
