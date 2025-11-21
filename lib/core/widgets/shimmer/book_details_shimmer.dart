import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BookDetailsShimmer extends StatelessWidget {
  const BookDetailsShimmer({super.key});

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
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header (Image and basic info)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: SizedBox(height: 180.h, width: 120.w),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: SizedBox(height: 24.h, width: double.infinity),
                      ),
                      verticalSpace(8),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: SizedBox(height: 16.h, width: 150.w),
                      ),
                      verticalSpace(8),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: SizedBox(height: 16.h, width: 100.w),
                      ),
                      verticalSpace(16),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: SizedBox(height: 20.h, width: 80.w),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(32),

            // Overview Section
            DecoratedBox(
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: SizedBox(height: 20.h, width: 100.w),
            ),
            verticalSpace(16),
            Column(
              children: List.generate(
                4,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: SizedBox(height: 14.h, width: double.infinity),
                  ),
                ),
              ),
            ),
            verticalSpace(32),

            // Details Grid
            DecoratedBox(
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: SizedBox(height: 20.h, width: 100.w),
            ),
            verticalSpace(16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              itemCount: 4,
              itemBuilder: (context, index) => DecoratedBox(
                decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
