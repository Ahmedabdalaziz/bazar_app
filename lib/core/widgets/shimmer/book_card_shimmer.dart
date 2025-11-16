import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BookCardShimmer extends StatelessWidget {
  const BookCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final baseColor = isDark
        ? theme.colorScheme.onSurface.withOpacity(0.1)
        : theme.colorScheme.secondary.withOpacity(0.5);

    final highlightColor = isDark
        ? theme.colorScheme.onSurface.withOpacity(0.3)
        : theme.colorScheme.secondary.withOpacity(0.2);

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      period: const Duration(milliseconds: 1500),
      child: SizedBox(
        height: 198.h,
        width: 127.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: SizedBox(height: 130.h, width: double.infinity),
            ),

            verticalSpace(8),

            DecoratedBox(
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: SizedBox(height: 14.h, width: 100.w),
            ),

            verticalSpace(6),

            DecoratedBox(
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: SizedBox(height: 14.h, width: 60.w),
            ),
          ],
        ),
      ),
    );
  }
}
