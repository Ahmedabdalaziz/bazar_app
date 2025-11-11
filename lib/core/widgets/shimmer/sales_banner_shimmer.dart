import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../spaces.dart';

class SalesBannerShimmer extends StatelessWidget {
  const SalesBannerShimmer({super.key});

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
      child: AspectRatio(
        aspectRatio: 127 / 198,
        child: Column(
          children: [
            Container(
              height: 128.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            verticalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Container(
                  width: 8.w,
                  height: 8.h,
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: baseColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
