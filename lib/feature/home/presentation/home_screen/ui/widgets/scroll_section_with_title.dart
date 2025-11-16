import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollableSection<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final double high;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final VoidCallback? onSeeAllTap;
  final double pageControllerViewportFraction;

  const ScrollableSection({
    super.key,
    required this.title,
    required this.items,
    required this.itemBuilder,
    this.high = 200,
    this.onSeeAllTap,
    this.pageControllerViewportFraction = 0.38,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              if (onSeeAllTap != null)
                GestureDetector(
                  onTap: onSeeAllTap,
                  child: Text(
                    s.seeAll,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
        verticalSpace(16),
        SizedBox(
          height: high.h,
          child: PageView.builder(
            controller: PageController(
              viewportFraction: pageControllerViewportFraction,
            ),
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padEnds: false,
            pageSnapping: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 8.w, right: (index == items.length - 1) ? 16.w : 8.w),
                child: itemBuilder(context, items[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}