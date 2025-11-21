import 'package:bazar_app/feature/home/data/models/vendors_model/vendor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PublisherCardWidget extends StatelessWidget {
  final VendorModel publisher;
  final VoidCallback onTap;

  const PublisherCardWidget({
    super.key,
    required this.publisher,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                image: publisher.logoUrl != null
                    ? DecorationImage(
                        image: NetworkImage(publisher.logoUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: publisher.logoUrl == null
                  ? Icon(
                      Icons.store_mall_directory_rounded,
                      size: 40.sp,
                      color: theme.disabledColor,
                    )
                  : null,
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                publisher.name,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
