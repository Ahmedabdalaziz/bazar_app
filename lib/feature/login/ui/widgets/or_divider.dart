import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../generated/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Divider(color: theme.colorScheme.secondary, thickness: 1),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            s.orWith,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: theme.colorScheme.secondary, thickness: 1),
        ),
      ],
    );
  }
}
