import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/authors/data/models/authors_model/author_model.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthorHeaderWidget extends StatelessWidget {
  final AuthorModel author;

  const AuthorHeaderWidget({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: theme.colorScheme.surfaceContainerHighest,
                width: 4.w,
              ),
              image: author.photoUrl != null
                  ? DecorationImage(
                      image: NetworkImage(author.photoUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: author.photoUrl == null
                ? CircleAvatar(
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    child: Icon(
                      Icons.person,
                      size: 60.sp,
                      color: theme.disabledColor,
                    ),
                  )
                : null,
          ),
          verticalSpace(16),
          Text(
            author.name,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(8),
          if (author.role != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                author.role!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star_rounded, color: Colors.amber, size: 24.sp),
              horizontalSpace(4),
              Text(
                (author.avgRating ?? 0.0).toStringAsFixed(1),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              horizontalSpace(8),
              Text(
                s.reviews(author.reviewCount.toString()),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
