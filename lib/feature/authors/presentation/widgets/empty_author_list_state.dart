import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bazar_app/generated/l10n.dart';
class EmptyAuthorListPageStateWidget extends StatelessWidget 
{
  final IconData icon;
  final String message;

  const EmptyAuthorListPageStateWidget({required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80.sp, color: theme.disabledColor.withOpacity(0.5)),
          verticalSpace(16),
          Text(
            message,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.disabledColor,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}

