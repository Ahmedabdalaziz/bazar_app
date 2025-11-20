import 'package:bazar_app/feature/authors/data/models/authors_model/author_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bazar_app/generated/l10n.dart';

class AuthorCardWidget extends StatelessWidget {
  final AuthorModel author;
  final VoidCallback onTap;

  const AuthorCardWidget({
    super.key,
    required this.author,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.surfaceContainerHighest,
                image: author.photoUrl != null
                    ? DecorationImage(
                        image: NetworkImage(author.photoUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: author.photoUrl == null
                  ? Icon(Icons.person, size: 40.sp, color: theme.disabledColor)
                  : null,
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                author.name,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 6.h),
            if (author.avgRating != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_rounded, size: 16.sp, color: Colors.amber),
                  SizedBox(width: 4.w),
                  Text(
                    author.avgRating!.toStringAsFixed(1),
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            SizedBox(height: 4.h),
            Text(
              s.reviews(author.reviewCount.toString()),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
