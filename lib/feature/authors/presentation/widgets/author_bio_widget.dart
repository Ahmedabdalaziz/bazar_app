import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bazar_app/generated/l10n.dart';

class AuthorBioWidget extends StatelessWidget {
  final String bio;

  const AuthorBioWidget({super.key, required this.bio});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.about,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            bio,
            style: theme.textTheme.bodyLarge?.copyWith(
              height: 1.5,
              color: theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
