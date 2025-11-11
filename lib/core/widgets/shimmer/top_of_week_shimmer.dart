import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'book_card_shimmer.dart';

class CategoryShimmerScrollable extends StatelessWidget {
  const CategoryShimmerScrollable({super.key, this.itemCount = 5});

  final int itemCount;

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Container(
              height: 20.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 198.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (context, index) => const BookCardShimmer(),
          ),
        ),
      ],
    );
  }
}
