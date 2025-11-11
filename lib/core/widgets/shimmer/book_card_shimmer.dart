import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:bazar_app/core/widgets/spaces.dart';

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
      period: const Duration(milliseconds: 1200),
      child: SizedBox(
        height: 198.h,
        width: 127.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            verticalSpace(8),
            Container(
              height: 14.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            verticalSpace(6),
            Container(
              height: 14.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
